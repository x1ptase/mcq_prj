import sql from 'mssql';
import { dbConfig } from '../config/env';

export { sql };

// sql.connect dùng lại global pool nên gọi nhiều lần không tạo kết nối mới
export function getPool(): Promise<sql.ConnectionPool> {
    return sql.connect(dbConfig);
}
