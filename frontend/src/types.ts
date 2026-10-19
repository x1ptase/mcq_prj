export type Role = 'user' | 'admin';

export interface User {
    id: number;
    username: string;
    role: Role;
}

export interface Course {
    id: number;
    code: string;
    name: string;
    question_count: number;
}

export interface Question {
    id: number;
    course_id: number;
    question: string | null;
    option_a: string | null;
    option_b: string | null;
    option_c: string | null;
    option_d: string | null;
    option_e: string | null;
    option_f: string | null;
    correct_answer: string | null;
}

export interface AttemptRow {
    id: number;
    course_id: number;
    code: string;
    course_name: string;
    score: number;
    total: number;
    created_at: string;
}

export interface AttemptDetail extends Omit<AttemptRow, 'code'> {
    answers: {
        question_id: number;
        selected_option: string;
        correct_answer: string;
        is_correct: boolean;
        question: string | null;
    }[];
}

export const LETTERS = ['A', 'B', 'C', 'D', 'E', 'F'] as const;
export type Letter = (typeof LETTERS)[number];
