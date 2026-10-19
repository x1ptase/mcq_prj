import { Router } from 'express';
import { clearSession, currentUser, setSession } from './auth.middleware';
import * as service from './auth.service';

export const authRouter = Router();

authRouter.post('/register', async (req, res) => {
    const user = await service.register(req.body?.username, req.body?.password);
    setSession(res, user.id);
    res.status(201).json(user);
});

authRouter.post('/login', async (req, res) => {
    const user = await service.login(req.body?.username, req.body?.password);
    setSession(res, user.id);
    res.json(user);
});

authRouter.post('/logout', (_req, res) => {
    clearSession(res);
    res.json({ success: true });
});

authRouter.get('/me', (_req, res) => {
    res.json(currentUser(res) ?? null);
});
