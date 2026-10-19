export interface Course {
    id: number;
    code: string;
    name: string;
}

export interface CourseSummary extends Course {
    question_count: number;
}

export interface CourseInput {
    code: string;
    name: string;
}
