import { BrowserRouter, Route, Routes } from 'react-router-dom';
import { Layout } from './components/Layout';
import { AuthProvider } from './context/AuthContext';
import { AdminPage } from './features/admin/AdminPage';
import { HistoryPage } from './features/history/HistoryPage';
import { QuizPage } from './features/quiz/QuizPage';

export default function App() {
    return (
        <AuthProvider>
            <BrowserRouter>
                <Routes>
                    <Route element={<Layout />}>
                        <Route index element={<QuizPage />} />
                        <Route path="history" element={<HistoryPage />} />
                        <Route path="admin" element={<AdminPage />} />
                        <Route path="*" element={<p className="py-24 text-center italic text-muted">Không tìm thấy trang.</p>} />
                    </Route>
                </Routes>
            </BrowserRouter>
        </AuthProvider>
    );
}
