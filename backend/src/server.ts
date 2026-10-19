import { createApp } from './app';
import { PORT } from './config/env';
import { ensureAdmin } from './modules/auth';

createApp().listen(PORT, () => {
    console.log(`>>> API chạy tại http://localhost:${PORT}`);
    ensureAdmin().catch(err => console.error('Không thể khởi tạo admin:', err.message));
});
