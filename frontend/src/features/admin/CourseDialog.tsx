import { FormEvent, useEffect, useState } from 'react';
import { Dialog, Field } from '../../components/Dialog';
import { api, errorMessage } from '../../lib/api';
import { Course } from '../../types';

interface Props {
    open: boolean;
    course: Course | null; // null = tạo mới
    onClose: () => void;
    onSaved: (id: number) => void;
}

export function CourseDialog({ open, course, onClose, onSaved }: Props) {
    const [code, setCode] = useState('');
    const [name, setName] = useState('');
    const [error, setError] = useState('');

    useEffect(() => {
        if (open) { setCode(course?.code ?? ''); setName(course?.name ?? ''); setError(''); }
    }, [open, course]);

    async function submit(e: FormEvent) {
        e.preventDefault();
        try {
            const saved = course
                ? await api<{ id: number }>(`/api/courses/${course.id}`, 'PUT', { code, name })
                : await api<{ id: number }>('/api/courses', 'POST', { code, name });
            onSaved(saved.id);
        } catch (err) {
            setError(errorMessage(err));
        }
    }

    return (
        <Dialog open={open} onClose={onClose} title={course ? 'Sửa môn học' : 'Môn học mới'}>
            <form onSubmit={submit}>
                <Field label="Mã môn"><input className="input" value={code} onChange={e => setCode(e.target.value)} required maxLength={50} /></Field>
                <Field label="Tên môn"><input className="input" value={name} onChange={e => setName(e.target.value)} required maxLength={200} /></Field>
                <p role="alert" className="min-h-6 text-sm text-oxblood">{error}</p>
                <div className="mt-2 flex justify-end gap-2">
                    <button type="button" className="btn" onClick={onClose}>Hủy</button>
                    <button type="submit" className="btn btn-primary">Lưu</button>
                </div>
            </form>
        </Dialog>
    );
}
