import sql from 'mssql';
import { dbConfig } from './config';

export { sql };

// sql.connect dùng lại global pool nên gọi nhiều lần không tạo kết nối mới
export function getPool(): Promise<sql.ConnectionPool> {
    return sql.connect(dbConfig);
}
