export type Role = 'user' | 'admin';

export interface AuthUser {
    id: number;
    username: string;
    role: Role;
}

export interface UserRecord extends AuthUser {
    password_hash: string;
}
