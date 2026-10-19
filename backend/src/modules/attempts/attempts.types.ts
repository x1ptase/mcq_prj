export interface AttemptRow {
    id: number;
    course_id: number;
    code: string;
    course_name: string;
    score: number;
    total: number;
    created_at: Date;
}

export interface AttemptAnswerRow {
    question_id: number;
    selected_option: string;
    correct_answer: string;
    is_correct: boolean;
    question: string | null;
}

export interface GradedAnswer {
    questionId: number;
    selected: string;
    correct: string;
    ok: boolean;
}
