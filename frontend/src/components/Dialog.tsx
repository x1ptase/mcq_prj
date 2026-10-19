import { ReactNode, useEffect, useRef } from 'react';

interface Props {
    open: boolean;
    onClose: () => void;
    title: string;
    wide?: boolean;
    children: ReactNode;
}

export function Dialog({ open, onClose, title, wide, children }: Props) {
    const ref = useRef<HTMLDialogElement>(null);

    useEffect(() => {
        const el = ref.current;
        if (!el) return;
        if (open && !el.open) el.showModal();
        if (!open && el.open) el.close();
    }, [open]);

    return (
        <dialog
            ref={ref}
            onClose={onClose}
            onClick={e => { if (e.target === ref.current) onClose(); }}
            className={`paper m-auto w-[calc(100vw-2rem)] p-0 text-ink backdrop:bg-black/55 ${wide ? 'max-w-2xl' : 'max-w-md'}`}
        >
            <div className="p-7">
                <h2 className="mb-1 text-2xl font-bold">{title}</h2>
                <div className="mb-5 h-px bg-rule" />
                {open && children}
            </div>
        </dialog>
    );
}

export function Field({ label, children }: { label: string; children: ReactNode }) {
    return (
        <label className="mb-4 block">
            <span className="eyebrow mb-1 block">{label}</span>
            {children}
        </label>
    );
}
