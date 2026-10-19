// Đường kẻ trang trí giữa hai nét kép, có hoa văn ở giữa
export function Ornament({ className = '' }: { className?: string }) {
    return (
        <div className={`flex items-center gap-3 text-gold ${className}`} aria-hidden>
            <span className="h-px flex-1 bg-rule" />
            <span className="text-sm leading-none">❖</span>
            <span className="h-px flex-1 bg-rule" />
        </div>
    );
}
