import { Router } from 'express';
import { parseId } from '../../shared/http';
import { requireAdmin } from '../auth';
import * as service from './questions.service';

export const questionsRouter = Router();

// Công khai: giao diện làm bài chấm tức thì nên trả cả correct_answer
questionsRouter.get('/', async (req, res) => {
    res.json(await service.listByCourse(parseId(req.query.courseId, 'courseId')));
});

questionsRouter.post('/', requireAdmin, async (req, res) => {
    res.status(201).json(await service.create(req.body));
});

questionsRouter.put('/:id', requireAdmin, async (req, res) => {
    await service.update(parseId(req.params.id), req.body);
    res.json({ success: true });
});

questionsRouter.delete('/:id', requireAdmin, async (req, res) => {
    await service.remove(parseId(req.params.id));
    res.json({ success: true });
});
