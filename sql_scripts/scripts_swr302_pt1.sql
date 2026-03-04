-- CHƯƠNG 1: THE ESSENTIAL OF SOFTWARE REQUIREMENT
INSERT INTO QuizQuestions (question, option_a, option_b, option_c, option_d, correct_answer) VALUES 
(N'Yêu cầu phần mềm được định nghĩa là gì?', N'Chỉ là mã nguồn chương trình', N'Bất cứ điều gì dẫn dắt các lựa chọn thiết kế', N'Sơ đồ cơ sở dữ liệu', N'Bản hướng dẫn sử dụng', 'B'), -- [cite: 34]
(N'Lỗi liên quan đến yêu cầu chiếm bao nhiêu phần trăm công sức khắc phục (Effort to Fix)?', N'7%', N'27%', N'56%', N'82%', 'D'), -- [cite: 31]
(N'Yêu cầu nào mô tả mục tiêu kinh doanh cấp cao của tổ chức?', N'User Requirement', N'Business Requirement', N'Functional Requirement', N'Quality Attribute', 'B'), -- [cite: 35]
(N'Đặc tính chất lượng (Quality attribute) thuộc loại yêu cầu nào?', N'Yêu cầu chức năng', N'Yêu cầu người dùng', N'Yêu cầu phi chức năng', N'Ràng buộc hệ thống', 'C'), -- [cite: 35]
(N'Kỹ nghệ yêu cầu (Requirement Engineering) được chia thành 2 nhánh chính là gì?', N'Phân tích và Thiết kế', N'Phát triển và Quản lý yêu cầu', N'Khơi gợi và Kiểm chứng', N'Lập trình và Kiểm thử', 'B'), -- [cite: 44]

-- CHƯƠNG 2: CUSTOMER'S PERSPECTIVE
(N'Khoảng cách kỳ vọng (Expectation gap) thường xảy ra do đâu?', N'Thiếu sự tham gia của khách hàng', N'Lập trình viên quá giỏi', N'Dự án quá ngắn', N'Sử dụng quá nhiều công nghệ mới', 'A'), -- [cite: 77]
(N'Khách hàng có quyền lợi nào sau đây?', N'Được thay đổi yêu cầu', N'Không cần trả tiền nếu dự án chậm', N'Yêu cầu BA làm việc 24/7', N'Tự ý đổi ngôn ngữ lập trình', 'A'), -- [cite: 85]
(N'Trách nhiệm của khách hàng trong dự án là gì?', N'Thiết lập các tiêu chí nghiệm thu (acceptance criteria)', N'Viết mã nguồn cùng lập trình viên', N'Quản lý nhân sự của đội IT', N'Cài đặt server dự án', 'A'), -- [cite: 100]
(N'Sự đồng thuận (Agreement) về yêu cầu đạt được khi nào?', N'Khi khách hàng ký hợp đồng', N'Khi các bên liên quan đồng ý yêu cầu giải quyết đúng nhu cầu và khả thi', N'Khi lập trình viên bắt đầu viết code', N'Khi dự án kết thúc', 'B'), -- [cite: 107, 108]
(N'Ai là người chịu trách nhiệm xác nhận yêu cầu có thể kiểm chứng được (verifiable)?', N'Developer', N'Business Analyst', N'Tester', N'Project Manager', 'C'), -- [cite: 109]

-- CHƯƠNG 3: GOOD PRACTICES
(N'Hoạt động nào thuộc giai đoạn Phát triển yêu cầu (Requirements Development)?', N'Lập kế hoạch tài chính', N'Khơi gợi (Elicitation)', N'Tuyển dụng nhân sự', N'Bán hàng', 'B'), -- [cite: 124, 132]
(N'Ma trận truy xuất nguồn gốc (traceability matrix) dùng để làm gì?', N'Tính lương nhân viên', N'Theo dõi mối liên hệ giữa các yêu cầu', N'Vẽ sơ đồ lớp', N'Quản lý mã nguồn', 'B'), -- [cite: 174]
(N'Từ điển dữ liệu (Data dictionary) nên được tạo ở giai đoạn nào?', N'Elicitation', N'Analysis', N'Specification', N'Validation', 'B'), -- [cite: 152]
(N'Mục đích của việc tạo nguyên mẫu (Prototypes) là gì?', N'Để hoàn thành dự án nhanh hơn', N'Để làm rõ yêu cầu và giao diện với người dùng', N'Để thay thế bản đặc tả', N'Để trình diễn công nghệ', 'B'), -- [cite: 149]
(N'BA nên sử dụng kỹ thuật nào cho yêu cầu phía Client?', N'Interface analysis', N'Use cases và UI prototypes', N'Data modeling', N'Algorithm design', 'B'), -- [cite: 120]

-- CHƯƠNG 4: THE BUSINESS ANALYST
(N'BA đóng vai trò cầu nối giao tiếp chính giữa khách hàng và ai?', N'Giám đốc tài chính', N'Các Stakeholders phát triển (Dev, Test, PM)', N'Gia đình khách hàng', N'Đối thủ cạnh tranh', 'B'), -- [cite: 208]
(N'Kỹ năng nào là thiết yếu nhất đối với một BA?', N'Kỹ năng lắng nghe và đặt câu hỏi', N'Kỹ năng sửa chữa phần cứng', N'Kỹ năng kế toán', N'Kỹ năng hội họa', 'A'), -- [cite: 221, 222]
(N'Nhiệm vụ của BA trong dự án Agile là gì?', N'Viết tài liệu dày hàng nghìn trang', N'Quản lý Product Backlog và viết Story cards', N'Thay thế hoàn toàn Product Owner', N'Tự mình code toàn bộ dự án', 'B'), -- [cite: 253, 255]
(N'Một BA giỏi thường có kiến thức về lĩnh vực nào?', N'Chỉ cần kiến thức IT', N'Cả kiến thức IT và lĩnh vực nghiệp vụ (Business domain)', N'Chỉ cần kiến thức về luật', N'Kiến thức về y khoa', 'B'), -- [cite: 235, 242]
(N'Lợi ích của việc hiểu sâu Business Domain đối với BA là gì?', N'Để nhận diện các yêu cầu ngầm định (implicit requirements)', N'Để làm thay công việc của khách hàng', N'Để yêu cầu tăng lương', N'Để chuyển sang làm marketing', 'A'), -- [cite: 242]

-- CHƯƠNG 5: BUSINESS REQUIREMENTS
(N'Tài liệu nào chứa các yêu cầu kinh doanh, tầm nhìn và phạm vi của dự án?', N'SRS', N'Vision and Scope Document', N'User Manual', N'Project Plan', 'B'), -- [cite: 261, 279]
(N'Phần "Scope and Limitations" trong tài liệu Vision & Scope mô tả điều gì?', N'Chi phí dự án', N'Các tính năng chính và những gì nằm ngoài phạm vi', N'Tiểu sử đội ngũ phát triển', N'Lịch sử công ty khách hàng', 'B'), -- [cite: 279]
(N'Sơ đồ ngữ cảnh (Context Diagram) dùng để làm gì?', N'Mô tả thuật toán', N'Hiển thị các thực thể bên ngoài tương tác với hệ thống', N'Thiết kế cơ sở dữ liệu', N'Phân bổ công việc trong nhóm', 'B'), -- [cite: 269, 281]
(N'Cây tính năng (Feature tree) có tác dụng gì?', N'Mô tả cấu trúc thư mục code', N'Phân cấp các tính năng sản phẩm một cách trực quan', N'Theo dõi lỗi phần mềm', N'Lập lịch trình dự án', 'B'), -- [cite: 283]
(N'Khi có yêu cầu thay đổi phạm vi, BA cần làm gì đầu tiên?', N'Đồng ý ngay lập tức', N'Đánh giá tác động (Impact analysis)', N'Từ chối ngay lập tức', N'Yêu cầu khách hàng trả thêm tiền', 'B'), -- [cite: 287]

-- CHƯƠNG 6: VOICE OF THE USER
(N'User Persona là gì?', N'Một người dùng thật sự của dự án', N'Một nhân vật giả định đại diện cho một nhóm người dùng', N'Tên của một phần mềm thiết kế', N'Trưởng nhóm phát triển', 'B'), -- [cite: 321]
(N'Product Champion có vai trò gì?', N'Tài trợ vốn cho dự án', N'Đại diện cho một lớp người dùng để cung cấp yêu cầu và ra quyết định', N'Quảng cáo sản phẩm ra thị trường', N'Lập trình giao diện người dùng', 'B'), -- [cite: 327, 328]
(N'Nguồn nào giúp nhận diện các lớp người dùng (User classes) tiềm năng?', N'Sơ đồ ngữ cảnh (Context Diagram)', N'Bảng lương nhân viên', N'Thời khóa biểu', N'Mã nguồn hệ thống', 'A'), -- [cite: 318]
(N'Trong Agile, ai thường đóng vai trò đại diện cho tiếng nói khách hàng?', N'Scrum Master', N'Product Owner', N'Developer', N'Designer', 'B'), -- [cite: 337]
(N'Nếu có mâu thuẫn yêu cầu giữa các lớp người dùng, ai sẽ là người quyết định?', N'Developer', N'Lớp người dùng được ưu tiên (favored user class)', N'Tester', N'Nhân viên bảo vệ', 'B'), -- [cite: 339]

-- CHƯƠNG 7: ELICITATION TECHNIQUES
(N'Kỹ thuật khơi gợi nào thu thập thông tin từ số lượng lớn người dùng một cách rẻ và nhanh?', N'Focus Groups', N'Questionnaires', N'Observations', N'Interviews', 'B'), -- [cite: 394]
(N'Quan sát thụ động (Passive observation) là gì?', N'Vừa làm vừa hỏi người dùng', N'Theo dõi người dùng làm việc mà không can thiệp', N'Yêu cầu người dùng viết báo cáo', N'Tự mình làm thử công việc của người dùng', 'B'), -- [cite: 381]
(N'Khi nào thì quá trình khơi gợi yêu cầu có thể tạm dừng?', N'Khi hết thời gian', N'Khi người dùng không thể nghĩ thêm use case mới hoặc chỉ lặp lại ý cũ', N'Khi lập trình viên thấy đủ rồi', N'Khi khách hàng đi nghỉ mát', 'B'), -- [cite: 459, 460]
(N'Yêu cầu ngầm định (Implied requirements) là gì?', N'Yêu cầu bí mật', N'Yêu cầu không được nói ra nhưng cần thiết để thực hiện yêu cầu khác', N'Yêu cầu do đối thủ cài vào', N'Yêu cầu không bao giờ thực hiện được', 'B'), -- [cite: 478]
(N'Focus Group thường dùng để khám phá điều gì?', N'Mã nguồn ứng dụng', N'Thái độ, ấn tượng và nhu cầu của người dùng', N'Cấu trúc phần cứng', N'Lỗi bảo mật', 'B'), -- [cite: 375]

-- CHƯƠNG 8: UNDERSTANDING USER REQUIREMENTS
(N'Tên của một Use Case nên được đặt theo format nào?', N'Danh từ', N'Động từ + Đối tượng (Verb + Object)', N'Tính từ + Danh từ', N'Tên của người dùng', 'B'), -- [cite: 505]
(N'Tác nhân (Actor) trong Use Case có thể là gì?', N'Con người, hệ thống khác hoặc thiết bị phần cứng', N'Chỉ có con người', N'Chỉ có các đoạn mã code', N'Chỉ có cơ sở dữ liệu', 'A'), -- [cite: 546, 550, 552]
(N'Luồng cơ bản (Basic flow) trong Use Case mô tả điều gì?', N'Các trường hợp lỗi', N'Lộ trình thành công phổ biến nhất (Happy path)', N'Các tính năng phụ', N'Cấu trúc dữ liệu', 'B'), -- [cite: 520, 598]
(N'Tiền điều kiện (Precondition) là gì?', N'Điều phải đúng sau khi thực hiện xong', N'Điều phải đúng trước khi Use Case có thể bắt đầu', N'Lỗi xảy ra trong quá trình thực hiện', N'Tên của người kích hoạt Use Case', 'B'), -- [cite: 539, 585]
(N'Phần mở rộng (Extensions/Alternate flows) dùng để mô tả gì?', N'Các bước lập trình chi tiết', N'Các kịch bản thay thế hoặc tình huống lỗi', N'Lịch sử thay đổi tài liệu', N'Danh sách Stakeholders', 'B'), -- [cite: 537, 607]

-- CHƯƠNG 9: BUSINESS RULES
(N'Quy tắc kinh doanh (Business rules) là gì?', N'Yêu cầu chức năng của phần mềm', N'Các tuyên bố chính sách, quy định dẫn dắt chức năng hệ thống', N'Các câu lệnh IF-ELSE trong code', N'Bản kế hoạch marketing', 'B'), -- [cite: 681, 704]
(N'Quy tắc nào quy định công thức tính toán (ví dụ: chiết khấu)?', N'Facts', N'Constraints', N'Computations', N'Action Enablers', 'C'), -- [cite: 689]
(N'Quy tắc "Chỉ quản lý mới có quyền phê duyệt hóa đơn" thuộc loại nào?', N'Fact', N'Constraint', N'Inference', N'Computation', 'B'), -- [cite: 689]
(N'BA nên làm gì để tránh dư thừa khi viết tài liệu về Quy tắc kinh doanh?', N'Chép lại toàn bộ quy tắc vào SRS', N'Tham chiếu đến mã ID của quy tắc trong danh mục (Catalog)', N'Bỏ qua không ghi chép', N'Viết vào phần ghi chú của code', 'B'), -- [cite: 707, 708]
(N'Nguồn nào có thể giúp khám phá quy tắc kinh doanh?', N'Chính sách công ty, luật pháp, quy định ngành', N'Thời tiết', N'Sở thích cá nhân của BA', N'Giá cổ phiếu', 'A'), -- [cite: 697]

-- CÂU HỎI TỔNG HỢP (THÊM)
(N'Mục tiêu của Validation trong kỹ nghệ yêu cầu là gì?', N'Để viết code nhanh hơn', N'Để xác nhận yêu cầu là chính xác và đáp ứng nhu cầu khách hàng', N'Để tìm lỗi trong code', N'Để thiết kế giao diện', 'B'), -- [cite: 167]
(N'Trong Agile, tài liệu yêu cầu nên ở mức độ nào?', N'Càng chi tiết càng tốt', N'Mức độ vừa đủ (just enough)', N'Không cần tài liệu', N'Chỉ cần hình vẽ', 'B'), -- [cite: 252]
(N'Ai là người chịu trách nhiệm chính trong việc khơi gợi yêu cầu?', N'Developer', N'Tester', N'Business Analyst', N'User', 'C'), -- [cite: 202, 213]
(N'Business Rule ảnh hưởng đến loại yêu cầu nào?', N'Tất cả các loại yêu cầu (Business, User, Functional, Quality)', N'Chỉ yêu cầu chức năng', N'Chỉ yêu cầu người dùng', N'Không ảnh hưởng đến yêu cầu', 'A'), -- [cite: 683]
(N'Tại sao cần phân loại yêu cầu?', N'Để làm cho tài liệu dài hơn', N'Để quản lý, ưu tiên và triển khai hiệu quả hơn', N'Để gây khó khăn cho lập trình viên', N'Để khoe với khách hàng', 'B'); -- [cite: 35]

-- PHẦN 2: 50 CÂU HỎI LÝ THUYẾT NÂNG CAO VÀ THUẬT NGỮ CHUYÊN NGÀNH (FIXED)
INSERT INTO QuizQuestions (question, option_a, option_b, option_c, option_d, correct_answer) VALUES 
-- CHAPTER 1 & 2: FOUNDATIONS
(N'Thuật ngữ "Gold Plating" trong Requirements Engineering nghĩa là gì?', N'Mạ vàng giao diện cho đẹp', N'Thêm các tính năng không cần thiết mà khách hàng không yêu cầu', N'Sử dụng các linh kiện đắt tiền', N'Tối ưu hóa mã nguồn cực hạn', 'B'),
(N'Sự khác biệt chính giữa Product Requirements và Project Requirements là gì?', N'Không có sự khác biệt', N'Product tập trung vào đặc tính hệ thống, Project tập trung vào các bàn giao liên quan đến quản lý dự án', N'Project quan trọng hơn Product', N'Product dành cho Dev, Project dành cho khách hàng', 'B'),
(N'Trong Requirements Bill of Rights, khách hàng có quyền gì đối với Business Analyst (BA)?', N'Yêu cầu BA làm việc thay Developer', N'Mong đợi BA sử dụng ngôn ngữ chuyên môn của khách hàng (Speak your language)', N'Yêu cầu BA thay đổi deadline liên tục', N'Yêu cầu BA viết code', 'B'),
(N'Trách nhiệm "Establish acceptance criteria" của khách hàng có nghĩa là gì?', N'Thiết lập các tiêu chí chấp nhận để nghiệm thu sản phẩm', N'Chấp nhận mọi lỗi sai của đội phát triển', N'Thiết lập mức lương cho đội dự án', N'Phê duyệt sơ đồ tổ chức', 'A'),
(N'Tại sao Requirements Engineering lại có tính lặp (Iterative)?', N'Do lập trình viên làm chậm', N'Để làm rõ các khoảng trống và điều chỉnh dựa trên phản hồi (feedback)', N'Để kéo dài thời gian dự án', N'Do khách hàng không biết mình muốn gì', 'B'),

-- CHAPTER 3 & 4: PROCESS & ROLE
(N'Hoạt động "Elicitation" trong Requirements Development Framework là gì?', N'Phân tích dữ liệu', N'Khơi gợi và thu thập yêu cầu từ Stakeholders', N'Viết code thử nghiệm', N'Kiểm thử tính năng', 'B'),
(N'Thuật ngữ "Traceability Matrix" dùng để đảm bảo điều gì?', N'Đảm bảo dự án không bị lỗ', N'Mọi yêu cầu đều có thể truy xuất nguồn gốc và được thực hiện/kiểm thử', N'Đảm bảo mã nguồn chạy nhanh', N'Đảm bảo giao diện đẹp', 'B'),
(N'Một Business Analyst (BA) thực hiện "Systems Thinking" nghĩa là gì?', N'Chỉ quan tâm đến một module duy nhất', N'Hiểu cách các thành phần tương tác và ảnh hưởng đến tổng thể hệ thống', N'Chỉ suy nghĩ về phần cứng', N'Suy nghĩ như một máy tính', 'B'),
(N'Trong Agile, tại sao BA cần tài liệu ở mức "Just enough"?', N'Để tiết kiệm giấy', N'Để duy trì sự linh hoạt và tránh lãng phí thời gian vào tài liệu không cần thiết', N'Vì lập trình viên không thích đọc', N'Vì dự án Agile không cần tài liệu', 'B'),
(N'Kỹ năng "Facilitation" của BA quan trọng nhất khi nào?', N'Khi ngồi viết code một mình', N'Khi điều phối các buổi họp lấy yêu cầu (workshops) với Stakeholders', N'Khi cài đặt phần mềm', N'Khi đi mua sắm thiết bị', 'B'),

-- CHAPTER 5 & 6: VISION, SCOPE & USER VOICE
(N'Tuyên bố "Vision Statement" trong tài liệu Vision and Scope tập trung vào điều gì?', N'Danh sách lỗi phần mềm', N'Trạng thái tương lai của sản phẩm khi các mục tiêu kinh doanh được đáp ứng', N'Sơ đồ tổ chức đội phát triển', N'Cấu trúc cơ sở dữ liệu', 'B'),
(N'Kỹ thuật "Ecosystem Map" khác gì với "Context Diagram"?', N'Ecosystem Map mô tả các hệ thống liên quan rộng hơn trong tổ chức', N'Không khác gì nhau', N'Ecosystem Map dùng để vẽ sơ đồ cây', N'Context Diagram phức tạp hơn', 'A'),
(N'Khái niệm "Scope Creep" ám chỉ điều gì?', N'Sự thu hẹp phạm vi dự án', N'Sự gia tăng phạm vi không được kiểm soát (phình to yêu cầu)', N'Dự án chạy đúng tiến độ', N'Đội ngũ nhân sự thay đổi', 'B'),
(N'Tại sao cần xác định "Product Champion" cho mỗi lớp người dùng?', N'Để có người trả tiền cơm trưa', N'Để có một đại diện chính yếu đưa ra quyết định về yêu cầu cho lớp người dùng đó', N'Để quảng cáo sản phẩm', N'Để giám sát lập trình viên', 'B'),
(N'Kỹ thuật "Collaboration pattern" của Ellen Gottesdiener giúp ích gì cho BA?', N'Xác định các User classes cho dự án', N'Viết code hiệu quả hơn', N'Thiết kế giao diện người dùng', N'Lập lịch trình dự án', 'A'),

-- CHAPTER 7: ELICITATION TECHNIQUES
(N'Trong kỹ thuật Observation, "Protocol Analysis" là gì?', N'Người quan sát ghi âm lại buổi họp', N'Người thực hiện tác vụ vừa làm vừa giải thích các bước họ đang thực hiện', N'Phân tích các giao thức mạng', N'Đo lường thời gian thực hiện tác vụ', 'B'),
(N'Nhược điểm lớn nhất của Questionnaires là gì?', N'Tốn quá nhiều chi phí', N'Dễ bị sai lệch và thiếu ngữ cảnh để giải thích các câu trả lời phức tạp', N'Không ai thèm trả lời', N'Dễ bị mất dữ liệu', 'B'),
(N'Tại sao cần sử dụng "Parking Lot" trong các buổi Requirements Workshops?', N'Để cất xe của Stakeholders', N'Để ghi lại các vấn đề quan trọng nhưng chưa cần giải quyết ngay để tránh làm loãng buổi họp', N'Để lưu trữ tài liệu đã hoàn thành', N'Để ghi tên những người đến muộn', 'B'),
(N'Mục đích của "Document Analysis" trong giai đoạn khơi gợi là gì?', N'Để tìm lỗi chính tả', N'Để lấy thông tin yêu cầu từ các tài liệu hiện có như quy trình, hợp đồng, SRS cũ', N'Để tiêu hủy tài liệu mật', N'Để in ấn báo cáo', 'B'),
(N'Khi nào nên sử dụng "Brainstorming" trong khơi gợi yêu cầu?', N'Khi cần tạo ra một lượng lớn ý tưởng sáng tạo trong thời gian ngắn', N'Khi cần kiểm thử phần mềm', N'Khi cần sa thải nhân viên', N'Khi cần viết hướng dẫn sử dụng', 'A'),

-- CHAPTER 8: USE CASES & SCENARIOS
(N'"Preconditions" của một Use Case phản ánh điều gì?', N'Kết quả sau khi Use Case kết thúc', N'Các điều kiện cần thiết phải thỏa mãn để Use Case có thể bắt đầu kích hoạt', N'Tên của người dùng', N'Tốc độ xử lý của hệ thống', 'B'),
(N'Trong Use Case Specification, "Postconditions" quan trọng vì sao?', N'Vì nó mô tả trạng thái hệ thống sau khi thực hiện xong', N'Vì nó mô tả giao diện', N'Vì nó mô tả lỗi hệ thống', N'Vì nó ghi tên người kiểm thử', 'A'),
(N'Sự khác biệt giữa "Include" và "Extend" trong Use Case là gì?', N'"Include" là bắt buộc, "Extend" là tùy chọn thực hiện trong một số điều kiện', N'Không có sự khác biệt', N'"Extend" là bắt buộc, "Include" là tùy chọn', N'Cả hai đều là bắt buộc', 'A'),
(N'Một "Secondary Actor" trong Use Case thường là gì?', N'Người dùng phụ của hệ thống', N'Một hệ thống hoặc cơ sở dữ liệu bên ngoài mà Use Case tương tác', N'Lập trình viên dự án', N'Khách hàng tiềm năng', 'B'),
(N'Tại sao "Use case name" nên bắt đầu bằng một Verb?', N'Để cho đẹp', N'Để thể hiện rõ hành động tạo ra giá trị của người dùng', N'Vì đó là quy tắc của ngôn ngữ tiếng Anh', N'Vì lập trình viên yêu cầu', 'B'),

-- CHAPTER 9: BUSINESS RULES
(N'Khái niệm "Atomic Business Rule" nghĩa là gì?', N'Quy tắc về năng lượng nguyên tử', N'Một quy tắc đơn lẻ, không thể phân chia thêm mà vẫn giữ nguyên ý nghĩa', N'Một quy tắc rất phức tạp', N'Quy tắc dành cho lập trình viên', 'B'),
(N'Loại Business Rule nào mô tả các công thức tính toán tài chính?', N'Facts', N'Computations', N'Constraints', N'Action Enablers', 'B'),
(N'Tại sao không nên sao chép Business Rules vào tài liệu SRS?', N'Để tiết kiệm dung lượng file', N'Để tránh dư thừa và dễ dàng bảo trì (Single source of truth)', N'Vì SRS không dành cho khách hàng', N'Vì quy tắc kinh doanh là bí mật', 'B'),
(N'Làm thế nào để liên kết Functional Requirements với Business Rules?', N'Sử dụng Traceability Matrix hoặc thuộc tính "Origin"', N'Ghi nhớ trong đầu', N'Gạch chân các từ quan trọng', N'Dán nhãn lên màn hình máy tính', 'A'),
(N'Quy tắc "Nếu khách hàng mua trên 1 triệu, tặng voucher 50k" thuộc loại nào?', N'Fact', N'Constraint', N'Action Enabler (Kích hoạt hành động)', N'Inference', 'C'),

-- GENERAL THEORY
(N'Thuật ngữ "Verification" khác gì với "Validation"?', N'Verification kiểm tra làm đúng đặc tả chưa, Validation kiểm tra có đúng cái khách hàng cần không', N'Hai thuật ngữ là một', N'Verification quan trọng hơn Validation', N'Validation dành cho Dev, Verification dành cho Test', 'A'),
(N'Một yêu cầu được coi là "Verifiable" khi nào?', N'Khi nó được viết bằng tiếng Anh', N'Khi có thể thiết kế một bài kiểm thử để xác nhận nó thực hiện đúng', N'Khi khách hàng nói nó đúng', N'Khi lập trình viên hiểu nó', 'B'),
(N'Mục đích của "Impact Analysis" là gì?', N'Để xem ai làm sai', N'Để đánh giá ảnh hưởng của một thay đổi đến các yêu cầu khác và tiến độ', N'Để tăng giá dự án', N'Để báo cáo cho giám đốc', 'B'),
(N'Yêu cầu "Hệ thống phải phản hồi trong vòng 2 giây" là loại yêu cầu nào?', N'Functional Requirement', N'Non-functional requirement (Performance)', N'Business Requirement', N'Constraint', 'B'),
(N'Ai là người chịu trách nhiệm phê duyệt "Requirements Baseline"?', N'Chỉ có khách hàng', N'Tất cả các Stakeholders chủ chốt đã thỏa thuận', N'Chỉ có PM', N'Chỉ có BA', 'B'),
(N'Phân tích "Object Life Cycles" giúp khám phá điều gì?', N'Vòng đời lập trình viên', N'Các trạng thái của dữ liệu và quy tắc chuyển đổi trạng thái', N'Thời hạn bảo hành máy tính', N'Số lượng nhân sự', 'B'),
(N'Kỹ thuật "Brainstorming" cần tuân thủ nguyên tắc nào?', N'Chỉ cho phép chuyên gia nói', N'Tạm hoãn mọi sự chỉ trích đối với các ý tưởng mới', N'Phải ra quyết định ngay lập tức', N'Ghi âm buổi họp', 'B'),
(N'Tại sao "Ambiguous requirements" lại nguy hiểm?', N'Vì làm tài liệu ngắn lại', N'Vì mỗi Stakeholder sẽ hiểu theo một cách khác nhau dẫn đến sản phẩm sai', N'Vì tốn giấy in', N'Vì làm BA bị đuổi việc', 'B'),
(N'Thuật ngữ "Stakeholder" bao gồm những ai?', N'Chỉ những người trả tiền', N'Bất kỳ ai bị ảnh hưởng bởi hoặc có ảnh hưởng đến dự án', N'Chỉ lập trình viên và tester', N'Chỉ người dùng cuối', 'B'),
(N'Mô hình "Context Diagram" nằm ở mức độ phân tích nào?', N'Mức chi tiết code', N'Mức độ bao quát hệ thống và tương tác bên ngoài', N'Mức độ giao diện nút bấm', N'Mức độ cơ sở dữ liệu', 'B'),
(N'Tại sao BA cần kỹ năng "Analytical skills"?', N'Để giải toán nhanh', N'Để phân tích thông tin hỗn tạp thành các yêu cầu có cấu trúc', N'Để sửa lỗi máy tính', N'Để viết email chuyên nghiệp', 'B'),
(N'Khi một yêu cầu là "Out of scope", BA nên làm gì?', N'Xóa bỏ hoàn toàn không lưu vết', N'Ghi lại và quản lý trong danh sách tính năng cho phiên bản tương lai', N'Cố gắng làm thêm cho khách hàng vui', N'Yêu cầu Dev làm trong giờ nghỉ', 'B'),
(N'Mục đích của "Acceptance Criteria" là gì?', N'Để đánh giá năng lực Dev', N'Để làm căn cứ cho khách hàng ký nghiệm thu sản phẩm', N'Để trang trí tài liệu', N'Để liệt kê danh sách nhân sự', 'B'),
(N'Thế nào là một "Favored user class"?', N'Lớp người dùng trả nhiều tiền nhất', N'Lớp người dùng có yêu cầu được ưu tiên cao nhất khi xảy ra mâu thuẫn', N'Lớp người dùng là người quen của giám đốc', N'Lớp người dùng dễ tính nhất', 'B'),
(N'Kỹ thuật "Prototyping" giúp giảm thiểu rủi ro nào?', N'Rủi ro tài chính', N'Rủi ro hiểu sai yêu cầu người dùng', N'Rủi ro virus máy tính', N'Rủi ro nhân sự nghỉ việc', 'B'),
(N'Trong Agile, "Product Backlog" được hiểu là gì?', N'Danh sách lỗi cần sửa', N'Danh sách ưu tiên các yêu cầu (User stories) cần thực hiện', N'Bản kế hoạch marketing', N'Kho chứa mã nguồn cũ', 'B'),
(N'Tại sao BA cần "Interpersonal skills"?', N'Để đi chơi với đồng nghiệp', N'Để xây dựng lòng tin và hợp tác hiệu quả với các Stakeholders', N'Để bán hàng tốt hơn', N'Để thuyết trình trước đám đông', 'B'),
(N'Khái niệm "Baseline" của tập yêu cầu nghĩa là gì?', N'Một đường kẻ trên giấy', N'Một phiên bản yêu cầu đã được phê duyệt làm mốc quản lý thay đổi', N'Yêu cầu đầu tiên', N'Yêu cầu cuối cùng', 'B'),
(N'Yêu cầu "Hệ thống phải chạy được trên cả Android và iOS" là loại gì?', N'Functional Requirement', N'Non-functional requirement (Portability)', N'Business Requirement', N'Business Rule', 'B'),
(N'Lợi ích của việc xác định "Decision makers" sớm là gì?', N'Để biết ai là sếp', N'Để giải quyết các bế tắc trong việc ra quyết định yêu cầu nhanh chóng', N'Để gửi email báo cáo', N'Để mời đi họp', 'B');
