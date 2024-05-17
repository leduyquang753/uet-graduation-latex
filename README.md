# Lớp tài liệu LaTeX cho khóa luận, đồ án tốt nghiệp VNU-UET

Đây là một lớp tài liệu (document class) để tạo ra một tài liệu khóa luận, đồ án tốt nghiệp theo đúng quy định của
Trường Đại học Công nghệ, Đại học Quốc gia Hà Nội sử dụng LaTeX.

## Cách sử dụng

Đưa hai tệp `uetgraduation.cls` và `UET logo.pdf` vào cùng thư mục với tệp LaTeX chính. Khai báo ở đầu tệp LaTeX chính
`\documentclass{uetgraduation}`.

### Tạo các trang bìa

Ở đầu phần thân tài liệu (sau `\begin{document}`), gọi các lệnh sau để đặt thông tin cho các trang bìa của tài liệu, mỗi
lệnh nhận một tham trị là giá trị của thông tin đó.

- `\studentname`: Họ và tên sinh viên.
- `\title`: Tên đề tài.
- `\documenttype`: Loại tài liệu tốt nghiệp.
- `\major`: Ngành học.
- `\year`: Năm bảo vệ.
- `\supervisor`: Cán bộ hướng dẫn.
- `\cosupervisor`: Cán bộ đồng hướng dẫn (nếu có).

Nếu cần có thêm trang phụ bìa bằng tiếng Anh (sinh viên CLC), gọi thêm các lệnh sau để đặt các thông tin bằng tiếng Anh:

- `\englishtitle`: Tên đề tài.
- `\englishmajor`: Ngành học.
- `\englishsupervisor`: Cán bộ hướng dẫn.
- `\englishcosupervisor`: Cán bộ đồng hướng dẫn.

Khi đó, một trang phụ bìa tiếng Anh sẽ tự động được tạo ra.

Sau khi đặt các thông tin, gọi lệnh `\makecovers` để tạo các trang phụ bìa.

Ví dụ:

```latex
\documentclass{uetgraduation}
\begin{document}
\studentname{Lê Duy Quang}
\title{Mẫu tài liệu tốt nghiệp cho LaTeX}
\documenttype{Khóa luận tốt nghiệp đại học hệ chính quy}
\major{Công nghệ thông tin}
\year{2024}
\supervisor{PGS. TS. Nguyễn Đông A}
\cosupervisor{TS. Phạm Tuấn B}
\englishtitle{Graduation document template for LaTeX}
\englishmajor{Information technology}
\englishsupervisor{Assoc. Prof., Dr. Nguyễn Đông A}
\englishcosupervisor{Dr. Phạm Tuấn B}
\makecovers
```

### Tạo các trang tóm tắt, lời cam đoan, lời cảm ơn,...

Với mỗi trang tóm tắt, lời cam đoan, lời cảm ơn,..., sử dụng môi trường `preamble` với một tham trị là tên trang.

Ví dụ:

```latex
\begin{preamble}{Tóm tắt}
\textbf{Tóm tắt:} Hiện nay, với sự phát triển nhanh chóng của các dịch vụ IP và sự bùng nổ của Internet đã dẫn đến một
loạt các vấn đề được đặt ra như: tốc độ truyền, quản lý chất lượng dịch vụ, điều phối dung lượng... Gần đây, công nghệ
chuyển mạch nhãn đa giao thức MPLS được đề xuất, MPLS đã kết hợp được khả năng định tuyến tốt ở lớp 3 và chuyển mạch ở
lớp 2, nó mở ra một viễn cảnh cho rất nhiều ứng dụng quan trọng. Mạng riêng ảo VPN là một trong những ứng dụng nổi bật
nhất của công nghệ MPLS, MPLS VPN đã khắc phục được hầu hết những nhược điểm tồn tại trước đó trong công nghệ VPN truyền
thống. Do vậy, trong đề tài khóa luận này em muốn giới thiệu công nghệ MPLS và dịch vụ MPLS VPN. Nội dung của đồ án sẽ
tập trung trình bày những đặc điểm cơ bản của kiến trúc MPLS, tính ưu việt trong ứng dụng MPLS VPN, và các bước tiến
hành cấu hình trên Router của hãng Cisco.

\textit{\textbf{Từ khóa:} MPLS, Chuyển mạch nhãn.}
\end{preamble}
```

### Tạo các trang mục lục, danh sách hình vẽ, bảng,...

Trong môi trường `contentlisting`, gọi các lệnh để đặt mục lục, danh sách hình vẽ, danh sách bảng,...:

- `\tableofcontents`: Mục lục.
- `\listoffigures`: Danh sách hình vẽ.
- `\listoftables`: Danh sách bảng.
- Các lệnh đặt danh sách khác cho các kiểu đính kèm tự định nghĩa (trình bày ở phía sau).

Ví dụ:

```latex
\begin{contentlisting}
\tableofcontents
\listoffigures
\listoftables
\end{contentlisting}
```

### Tiêu đề các chương và mục

Sử dụng các lệnh sau để bắt đầu một chương, mục hoặc tiểu mục mới, với một tham trị là tiêu đề chương hoặc mục đó:

- `\chapter`: Chương.
- `\section`: Mục.
- `\subsection`: Tiểu mục.

Cần lưu ý để một dòng trống giữa văn bản của một mục và tiêu đề của mục tiếp theo.

Ví dụ:

```latex
\chapter{Mở đầu}
\section{Sự cần thiết}
\subsection{Lịch sử}
Lịch sử bắt đầu từ...

\subsection{Những cơ hội và hạn chế}
Với lịch sử lâu dài như vậy, ta có...
```

### Phụ đề hình vẽ, bảng và các kiểu đính kèm khác

Đặt phụ đề cho hình vẽ bằng lệnh `\figurecaption`, cho bảng bằng lệnh `\tablecaption`, với một tham trị là tên hình vẽ
hoặc bảng. Phụ đề sẽ được tự động đánh số. Ví dụ:

```latex
\figurecaption{Mô hình ca sử dụng cho hệ thống phần mềm BidArt}
```

Có thể tạo thêm những kiểu đính kèm khác cho đồ thị, thuật toán, đoạn mã nguồn bằng cách sử dụng lệnh
`\makeattachmenttype` ở trước `\begin{document}` với cú pháp:

```latex
\makeattachmenttype{định danh kiểu đính kém}{nội dung đặt trước số}{định danh danh sách}{lệnh đặt danh sách}{tiêu đề danh sách}
```

Ví dụ kiểu đính kèm hình vẽ được định nghĩa như sau:

```latex
\makeattachmenttype{figure}{Hình}{lof}{\listoffigures}{Danh sách hình vẽ}
```

Để đặt phụ đề, sử dụng lệnh với tên là định danh kiểu theo sau là `caption` (ví dụ từ `figure` sẽ ra `\figurecaption`).

### Danh sách tài liệu tham khảo

Thực hiện đặt danh sách tài liệu tham khảo ở cuối tài liệu như bình thường, quy cách đã được thiết lập sẵn.

## Góp ý

Lớp tài liệu này vừa được tạo ra nên nhiều khả năng sẽ còn lỗi và thiếu sót. Nếu gặp vấn đề, bạn hãy tạo issue hoặc nếu
có khả năng bạn có thể tạo pull request sửa lại vấn đề. Xin cảm ơn những đóng góp của bạn.