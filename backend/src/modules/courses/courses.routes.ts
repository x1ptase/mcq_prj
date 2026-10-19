import { Router } from 'express';
import { parseId } from '../../shared/http';
import { requireAdmin } from '../auth';
import * as service from './courses.service';

export const coursesRouter = Router();

coursesRouter.get('/', async (_req, res) => {
    res.json(await service.list());
});

coursesRouter.post('/', requireAdmin, async (req, res) => {
    res.status(201).json(await service.create(req.body));
});

coursesRouter.put('/:id', requireAdmin, async (req, res) => {
    res.json(await service.update(parseId(req.params.id), req.body));
});

coursesRouter.delete('/:id', requireAdmin, async (req, res) => {
    await service.remove(parseId(req.params.id));
    res.json({ success: true });
});
