export const LETTERS = ['a', 'b', 'c', 'd', 'e', 'f'] as const;
export type Letter = (typeof LETTERS)[number];

export interface Question {
    id: number;
    course_id: number;
    question: string;
    option_a: string;
    option_b: string;
    option_c: string;
    option_d: string;
    option_e: string;
    option_f: string;
    correct_answer: string;
}

export interface QuestionInput {
    course_id: number;
    question: string;
    options: Record<Letter, string>;
    correct_answer: string;
}
