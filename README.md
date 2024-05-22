# Lớp tài liệu LaTeX cho khóa luận, đồ án tốt nghiệp VNU-UET

Đây là một lớp tài liệu (document class) để tạo ra một tài liệu khóa luận, đồ án tốt nghiệp theo đúng quy định của
Trường Đại học Công nghệ, Đại học Quốc gia Hà Nội sử dụng LaTeX.

## Cách sử dụng

> [!IMPORTANT]
> Sử dụng XeTeX để xử lí mã nguồn của tài liệu, do lớp tài liệu sử dụng font TrueType và các tính năng Unicode.

Đưa các tệp `uetgraduation.cls`, `sizes.clo` và `UET logo.pdf` vào cùng thư mục với tệp LaTeX chính. Khai báo ở đầu tệp
LaTeX chính `\documentclass{uetgraduation}`.

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

Sau khi đặt các thông tin, gọi lệnh `\makecovers` để tạo các trang bìa và phụ bìa.

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
\textbf{Tóm tắt:} Hiện nay, với sự phát triển nhanh chóng của các dịch vụ IP và
sự bùng nổ của Internet đã dẫn đến một loạt các vấn đề được đặt ra như: tốc độ
truyền, quản lý chất lượng dịch vụ, điều phối dung lượng... Gần đây, công nghệ
chuyển mạch nhãn đa giao thức MPLS được đề xuất, MPLS đã kết hợp được khả năng
định tuyến tốt ở lớp 3 và chuyển mạch ở lớp 2, nó mở ra một viễn cảnh cho rất
nhiều ứng dụng quan trọng. Mạng riêng ảo VPN là một trong những ứng dụng nổi
bật nhất của công nghệ MPLS, MPLS VPN đã khắc phục được hầu hết những nhược
điểm tồn tại trước đó trong công nghệ VPN truyền thống. Do vậy, trong đề tài
khóa luận này em muốn giới thiệu công nghệ MPLS và dịch vụ MPLS VPN. Nội dung
của đồ án sẽ tập trung trình bày những đặc điểm cơ bản của kiến trúc MPLS, tính
ưu việt trong ứng dụng MPLS VPN, và các bước tiến hành cấu hình trên Router của
hãng Cisco.

\textit{\textbf{Từ khóa:} MPLS, Chuyển mạch nhãn.}
\end{preamble}
```

### Tạo các trang mục lục, danh sách hình vẽ, bảng,...

Trong môi trường `contentlisting`, gọi các lệnh để đặt mục lục, danh sách hình vẽ, danh sách bảng,...:

- `\tableofcontents`: Mục lục.
- `\listoffigures`: Danh sách hình vẽ.
- `\listoftables`: Danh sách bảng.
- Các lệnh đặt danh sách khác cho các kiểu đính kèm tự định nghĩa (trình bày ở phía sau).
- Các phần liệt kê khác như danh sách từ viết tắt, đặt trong môi trường `contentlistingsection` với một tham trị là tiêu
  đề của danh sách.

Ví dụ:

```latex
\begin{contentlisting}

\tableofcontents
\listoffigures
\listoftables

\begin{contentlistingsection}{Các từ viết tắt}
CRC: cyclic redundancy check -- mã kiểm tra dạng vòng.

DES: data encryption standard -- chuẩn mã hóa dữ liệu cũ của NSA.
\end{contentlistingsection}

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

### Hình vẽ, bảng và các kiểu đính kèm khác

Tạo chỗ chứa hình vẽ bằng môi trường `figure`, chỗ chứa bảng bằng môi trường `table`, với một tham trị là tên hình vẽ
hoặc bảng đó. Phụ đề sẽ được tự động đánh số. Ví dụ:

```latex
\begin{table}{Kích cỡ của các kiểu số nguyên trên Windows 64-bit}
\centering
\begin{tabular}{|l|r|}
\hline
\textbf{Kiểu} & \textbf{Số bit} \\ \hline
char & 8 \\
short & 16 \\
int & 32 \\
long & 32 \\
long long & 64 \\
\hline
\end{tabular}
\end{table}
```

Có thể tạo thêm những kiểu đính kèm khác cho đồ thị, thuật toán, đoạn mã nguồn,... bằng cách sử dụng lệnh
`\makeattachmenttype` ở trước `\begin{document}` với cú pháp:

```latex
\makeattachmenttype
	{định danh kiểu đính kèm}
	{các vị trí đặt}
	{nội dung đặt trước số}
	{nội dung chèn vào phía trước}
	{nội dung chèn vào phía sau}
	{định danh danh sách}
	{lệnh đặt danh sách}
	{tiêu đề danh sách}
```

Các vị trí đặt là một số trong số bốn chữ cái sau viết liền nhau:

- `h`: Vị trí hiện tại.
- `t`: Vị trí đầu trang.
- `b`: Vị trí cuối trang.
- `p`: Trên một trang riêng.

Dùng lệnh `\captionbox`, thường là ở trong nội dung chèn vào phía trước hoặc phía sau, để đặt một hộp phụ đề với một
tham số là nội dung phụ đề. Lệnh `\caption` cho ra nội dung phụ đề để đặt vào trong `\captionbox` cùng với các lệnh định
dạng khác nếu có.

Ví dụ kiểu đính kèm hình vẽ được định nghĩa như sau:

```latex
\makeattachmenttype{figure}{htbp}{Hình}{}{%
	\vspace{0.25cm}\captionbox{\setfontsize{12pt}\caption}%
}{lof}{\listoffigures}{Danh sách hình vẽ}
```

### Danh sách tài liệu tham khảo

Đặt môi trường `thebibliography` ở cuối tài liệu với một tham trị là một số có số chữ số bằng với số chữ số của số tài
liệu tham khảo (ví dụ nếu có 35 tài liệu thì chọn một số có hai chữ số như 99). Bên trong, với mỗi ngôn ngữ của tài liệu
tham khảo, đặt một môi trường `bibsection` với một tham trị là ngôn ngữ đó, rồi bên trong đặt các mục tài liệu
`\bibitem` tương ứng.

Ví dụ:

```latex
\begin{thebibliography}{9}
\begin{bibsection}{Tiếng Việt}
\bibitem{dieu1999}
	Phan Đình Diệu,
	\textit{Lí thuyết về độ phức tạp tính toán},
	Nhà xuất bản Đại học Quốc gia Hà Nội, 1999, tr. 15-25.
\bibitem{cuong2005}
	Nguyễn Việt Cường, Nguyễn Thị Thùy Linh, Phan Xuân Hiếu, Hà Quang Thụy,
	``Bài toán lọc và phân lớp nội dung Web tiếng Việt với hướng tiếp cận
	entropy cực đại'',
	\textit{Kỉ yếu Hội thảo quốc gia lần thứ VIII Một số vấn đề chọn lọc của
	Công nghệ thông tin và truyền thông},
	2005, tr. 1-2.
\end{bibsection}

\begin{bibsection}{Tiếng Anh}
\bibitem{allister2008}
	M.W. Allister and S.A. Long,
	``Resonant hemispherical dielectric antenna'',
	\textit{Electronics letters}, Vol. 20,
	2008, pp. 657-659.
\bibitem{dym1991}
	C.L. Dym and R.E. Levit,
	\textit{Knowledge-based systems in engineering},
	McGraw-Hill, 1991, pp. 51, 76, 102-108.
\end{bibsection}
\end{thebibliography}
```

## Góp ý

Lớp tài liệu này vừa được tạo ra nên nhiều khả năng sẽ còn lỗi và thiếu sót. Nếu gặp vấn đề, bạn hãy tạo issue hoặc nếu
có khả năng bạn có thể tạo pull request sửa lại vấn đề. Xin cảm ơn những đóng góp của bạn.