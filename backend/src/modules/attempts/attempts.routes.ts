import { Router } from 'express';
import { parseId } from '../../shared/http';
import { currentUser, requireAuth } from '../auth';
import * as service from './attempts.service';

export const attemptsRouter = Router();
attemptsRouter.use(requireAuth);

attemptsRouter.post('/', async (req, res) => {
    const user = currentUser(res)!;
    res.status(201).json(await service.submit(user.id, req.body?.courseId, req.body?.answers));
});

attemptsRouter.get('/', async (_req, res) => {
    res.json(await service.listMine(currentUser(res)!.id));
});

attemptsRouter.get('/:id', async (req, res) => {
    res.json(await service.detail(parseId(req.params.id), currentUser(res)!.id));
});
