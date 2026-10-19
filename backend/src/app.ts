import express from 'express';
import path from 'path';
import { FRONTEND_DIST } from './config/env';
import { errorHandler } from './shared/http';
import { attemptsRouter } from './modules/attempts';
import { authRouter, loadUser } from './modules/auth';
import { coursesRouter } from './modules/courses';
import { questionsRouter } from './modules/questions';

export function createApp(): express.Express {
    const app = express();
    app.use(express.json());

    app.use('/api', loadUser);
    app.use('/api/auth', authRouter);
    app.use('/api/courses', coursesRouter);
    app.use('/api/questions', questionsRouter);
    app.use('/api/attempts', attemptsRouter);
    app.use('/api', (_req, res) => { res.status(404).json({ message: 'Không tìm thấy API.' }); });

    // Production: phục vụ bản build của frontend (SPA fallback về index.html)
    if (FRONTEND_DIST) {
        const dist = path.resolve(FRONTEND_DIST);
        app.use(express.static(dist));
        app.get(/.*/, (_req, res) => res.sendFile(path.join(dist, 'index.html')));
    }

    app.use(errorHandler);
    return app;
}
