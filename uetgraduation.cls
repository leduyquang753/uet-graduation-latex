% vim:syntax=tex
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{uetgraduation}[2024/12/31
	LaTeX document class for Vietnam National University, University of Engineering and Technology (VNU-UET)
	graduation documents.
]

\input{sizes.clo}

\RequirePackage{amsmath}
\RequirePackage{float}
\RequirePackage[a4paper,left=3cm,right=2cm,top=2.5cm,bottom=2cm,includefoot,footskip=1cm]{geometry}
\RequirePackage{fontspec}
\RequirePackage{graphicx}
\RequirePackage{icomma}
\RequirePackage{indentfirst}
\RequirePackage[fontspec-loader]{mathfont}
\RequirePackage{siunitx}
\RequirePackage{tikz}
	\usetikzlibrary{calc}

\directlua{
function custom_math_constants(fontdata)
  fontdata.MathConstants = fontdata.MathConstants or {}
  fontdata.MathConstants["SpaceAfterScript"] = 0
  mathfont.math_constants(fontdata)
end
luatexbase.add_to_callback("mathfont.add_math_constants", custom_math_constants, "custom_math_constants")
}

\raggedbottom
\lefthyphenmin 64
\frenchspacing
\setmainfont{Times New Roman}
\mathfont[upper,lower,digits]{Times New Roman}
\pagenumbering{roman}
\newcounter{firstContentPageIndex}

\widowpenalty \@M
\clubpenalty \@M
\@beginparpenalty -51
\@endparpenalty -51
\@itempenalty -51
\renewcommand\theenumi{\@arabic\c@enumi}
\renewcommand\theenumii{\@alph\c@enumii}
\renewcommand\theenumiii{\@roman\c@enumiii}
\renewcommand\theenumiv{\@Alph\c@enumiv}
\newcommand\labelenumi{\theenumi.}
\newcommand\labelenumii{\theenumii)}
\newcommand\labelenumiii{\theenumiii)}
\newcommand\labelenumiv{\theenumiv)}
\renewcommand\p@enumii{\theenumi.}
\renewcommand\p@enumiii{\theenumi.\theenumii.}
\renewcommand\p@enumiv{\p@enumiii.\theenumiii.}
\newcommand\labelitemi{\labelitemfont \char"2013}
\newcommand\labelitemii{\labelitemfont +}
\newcommand\labelitemiii{\labelitemfont \char"2022}
\newcommand\labelitemiv{\labelitemfont \char"25E6}
\newcommand\labelitemfont{\normalfont}
\newlength\customfontsize
\newcommand\setfontsize[1]{\setlength\customfontsize{#1}\fontsize{\customfontsize}{1.3\customfontsize}\selectfont}

\def\@meta@studentname{\PackageError{uetgraduation}{Student name is not specified.}{
	The student's name needs to be specified for the cover pages.
}}
\def\@meta@title{\PackageError{uetgraduation}{Title is not specified.}{
	The title needs to be specified for the cover pages.
}}
\def\@meta@documenttype{\PackageError{uetgraduation}{Document type is not specified.}{
	The document type needs to be specified for the cover pages.
}}
\def\@meta@major{\PackageError{uetgraduation}{Major is not specified.}{
	The major needs to be specified for the cover pages.
}}
\def\@meta@year{\PackageError{uetgraduation}{Year is not specified.}{
	The year needs to be specified for the cover pages.
}}
\def\@meta@supervisor{\PackageError{uetgraduation}{Supervisor name is not specified.}{
	The supervisor's name needs to be specified for the cover pages.
}}
\def\@meta@cosupervisor\relax
\def\@meta@englishtitle\relax
\def\@meta@englishmajor{\PackageError{uetgraduation}{English major is not specified.}{
	The major name in English needs to be specified for the cover pages.
}}
\def\@meta@englishsupervisor{\PackageError{uetgraduation}{English supervisor name is not specified.}{
	The supervisor's name in English needs to be specified for the cover pages.
}}
\def\@meta@englishcosupervisor{\PackageError{uetgraduation}{English co-supervisor name is not specified.}{
	The co-supervisor's name in Engligh needs to be specified for the cover pages.
}}
\newif\if@meta@hascosupervisor\@meta@hascosupervisorfalse
\newif\if@meta@hasenglishsections\@meta@hasenglishsectionsfalse
\DeclareRobustCommand\studentname[1]{\global\def\@meta@studentname{#1}}
\DeclareRobustCommand\title[1]{\global\def\@meta@title{#1}}
\DeclareRobustCommand\documenttype[1]{\global\def\@meta@documenttype{#1}}
\DeclareRobustCommand\major[1]{\global\def\@meta@major{#1}}
\DeclareRobustCommand\year[1]{\global\def\@meta@year{#1}}
\DeclareRobustCommand\supervisor[1]{\global\def\@meta@supervisor{#1}}
\DeclareRobustCommand\cosupervisor[1]{\global\def\@meta@cosupervisor{#1}\@meta@hascosupervisortrue}
\DeclareRobustCommand\englishtitle[1]{\global\def\@meta@englishtitle{#1}\@meta@hasenglishsectionstrue}
\DeclareRobustCommand\englishmajor[1]{\global\def\@meta@englishmajor{#1}}
\DeclareRobustCommand\englishsupervisor[1]{\global\def\@meta@englishsupervisor{#1}}
\DeclareRobustCommand\englishcosupervisor[1]{\global\def\@meta@englishcosupervisor{#1}}
\newenvironment{coverpage}{%
	\setlength\parindent{0cm}\tikz[overlay, remember picture]{
		\draw[line width=3pt,color=black,fill=none]
			($(current page.north west)+(2.5cm,-2cm)$) rectangle ($(current page.south east)-(1.5cm,-2.5cm)$);
		\draw[line width=1pt,color=black,fill=none]
			($(current page.north west)+(2.65cm,-2.15cm)$) rectangle ($(current page.south east)-(1.65cm,-2.65cm)$);
	}%
}{\clearpage\normalsize}
\newcommand\makecovers{
	\begin{coverpage}%
		\centering%
		\setfontsize{12pt}\textbf{ĐẠI HỌC QUỐC GIA HÀ NỘI}\par
		\textbf{TRƯỜNG ĐẠI HỌC CÔNG NGHỆ}\par
		\vspace{2cm}\includegraphics[scale=0.6]{UET logo.pdf}\par
		\vspace{0.5cm}\setfontsize{14pt}\textbf{\@meta@studentname}\par
		\vspace{1.5cm}\setfontsize{18pt}\textbf{\MakeUppercase{\@meta@title}}\par
		\vspace{2cm}\setfontsize{14pt}\textbf{\MakeUppercase{\@meta@documenttype}}\par
		\textbf{Ngành: \@meta@major}\par
		\vfill\setfontsize{12pt}\textbf{HÀ NỘI -- \@meta@year}\par%
	\end{coverpage}
	\begin{coverpage}%
		{
			\centering%
			\setfontsize{12pt}\textbf{ĐẠI HỌC QUỐC GIA HÀ NỘI}\par
			\textbf{TRƯỜNG ĐẠI HỌC CÔNG NGHỆ}\par
			\vspace{1.5cm}\setfontsize{14pt}\textbf{\@meta@studentname}\par
			\vspace{1.5cm}\setfontsize{18pt}\textbf{\MakeUppercase{\@meta@title}}\par
			\vspace{3cm}\setfontsize{14pt}\textbf{\MakeUppercase{\@meta@documenttype}}\par
			\textbf{Ngành: \@meta@major}\par%
		}
		\vspace{2.5cm}\setfontsize{14pt}\textbf{Cán bộ hướng dẫn: \@meta@supervisor}\par%
		\if@meta@hascosupervisor\vspace{3cm}\textbf{Cán bộ đồng hướng dẫn: \@meta@cosupervisor}\par\fi%
		{
			\centering\vfill\setfontsize{12pt}\textbf{HÀ NỘI -- \@meta@year}\par%
		}
	\end{coverpage}
	\if@meta@hasenglishsections\begin{coverpage}%
		{
			\centering%
			\setfontsize{12pt}\textbf{VIETNAM NATIONAL UNIVERSITY, HANOI}\par
			\textbf{UNIVERSITY OF ENGINEERING AND TECHNOLOGY}\par
			\vspace{1.5cm}\setfontsize{14pt}\textbf{\@meta@studentname}\par
			\vspace{1.5cm}\setfontsize{18pt}\textbf{\MakeUppercase{\@meta@englishtitle}}\par
			\vspace{3cm}\setfontsize{14pt}\textbf{Major: \@meta@englishmajor}\par
		}
		\vspace{3cm}\setfontsize{14pt}\textbf{Supervisor: \@meta@englishsupervisor}\par%
		\if@meta@hascosupervisor\vspace{3cm}\textbf{Co-Supervisor: \@meta@englishcosupervisor}\par\fi%
		{
			\centering\vfill\setfontsize{12pt}\textbf{HÀ NỘI -- \@meta@year}\par%
		}
	\end{coverpage}\fi
}

\newenvironment{preamble}[1]{%
	\clearpage\setlength\parindent{0cm}{\centering\textbf{\MakeUppercase{#1}}\par}\vspace{1cm}\setfontsize{12pt}
}{\normalsize}

\newif\if@incontentlisting\@incontentlistingfalse
\newenvironment{contentlisting}{\clearpage\@incontentlistingtrue}{\@incontentlistingfalse\clearpage}

\setcounter{tocdepth}{3}
\newenvironment{contentlistingsection}[1]{%
	\if@incontentlisting\else\PackageError{uetgraduation}{
		Content listing section not in \`contentlisting\` environment.
	}{
		To ensure consistency, place all content listing sections into the \`contentlisting\` environment.
	}\fi%
	\noindent\Large\textbf{#1}\par\vspace{1cm}\normalsize
}{\clearpage}
\newcommand\tableofcontents{\begin{contentlistingsection}{Mục lục}\@starttoc{toc}\end{contentlistingsection}}
\renewcommand\numberline[2]{#1 #2}
\newcommand\@tocline[4]{\ifnum #1>\c@tocdepth\else
	\vskip\z@\@plus.2\p@{%
		\raggedright\parindent #2\hangindent #2\rightskip 1cm\parfillskip -1cm\interlinepenalty\@M\leavevmode
		\ifnum #1=1\textbf{#3}\else #3\fi%
		\leaders\hbox{$\m@th\mkern0.5mu\hbox{.}\mkern0.5mu$}\hfill #4\par%
	}
\fi}
\newcommand*\l@chapter{\@tocline{1}{0cm}}
\newcommand*\l@section{\@tocline{2}{0.5cm}}
\newcommand*\l@subsection{\@tocline{3}{1cm}}

\newcounter{chapter}
\newcounter{section}[chapter]
\newcounter{subsection}[section]
\renewcommand\thechapter{\@arabic\c@chapter}
\renewcommand\thesection{\thechapter.\@arabic\c@section}
\renewcommand\thesubsection{\thesection.\@arabic\c@subsection}
\newcommand\@chapterprefix{Chương}
\newif\if@firstchapter\@firstchaptertrue
\newcommand\chapter[1]{%
	\clearpage\refstepcounter{chapter}
	\if@firstchapter%
		\setcounter{firstContentPageIndex}{\value{page}}%
		\pagestyle{plain}\pagenumbering{arabic}\setcounter{page}{1}%
		\@firstchapterfalse%
	\fi
	\addcontentsline{toc}{chapter}{\protect\numberline{\@chapterprefix\ \thechapter.}{#1}}
	\noindent\huge\textbf{\@chapterprefix\ \thechapter.}\par
	\noindent\huge\textbf{#1}\par\vspace{1cm}\normalsize%
}
\newcommand\appendix{%
	\par%
	\setcounter{chapter}{0}%
	\setcounter{section}{0}%
	\renewcommand\@chapterprefix{Phụ lục}%
	\renewcommand\thechapter{\@Alph\c@chapter}%
}
\newcommand\@makesection[2]{%
	\if@nobreak\everypar{}\else\addpenalty\@secpenalty\vspace{#1}\fi#2\par\nobreak\@nobreaktrue\normalsize%
	\everypar{\@nobreakfalse\everypar{}}%
}
\newcommand\section[1]{\@makesection{1cm}{%
	\refstepcounter{section}\addcontentsline{toc}{section}{\protect\numberline{\thesection.}{#1}}
	\noindent\Large\textbf{\thesection. #1}
}}
\newcommand\subsection[1]{\@makesection{0.5cm}{%
	\refstepcounter{subsection}\addcontentsline{toc}{subsection}{\protect\numberline{\thesubsection.}{#1}}
	\noindent\large\textbf{\thesubsection. #1}
}}

\newcommand\attachmentcaptionbox[1]{\par\begingroup\@parboxrestore\if@minipage\@setminipage\fi#1\par\endgroup}
\newcommand\attachmentcaption{%
	\ifx\@captype\@undefined\PackageError{uetgraduation}{Caption outside attachment}{
		A caption needs to be inside an attachment environment.
	}\fi%
	\addcontentsline{\csname ext@\@captype\endcsname}{\@captype}{%
		\protect\numberline{\csname the\@captype\endcsname.}{\ignorespaces \@captiontext}%
	}%
	\csname prefix@\@captype\endcsname\nobreakspace\csname the\@captype\endcsname. \@captiontext%
}
% Arguments:
% 1. Attachment identifier.
% 2. Placement specifier.
% 3. Number prefix.
% 4. Before content.
% 5. After content.
% 6. Listing file extension.
% 7. List command.
% 8. List title.
\newcommand\makeattachmenttype[8]{
	\newcounter{a@#1}[chapter]
	\expandafter\renewcommand\csname thea@#1\endcsname{\thechapter.\@arabic\csname c@a@#1\endcsname}
	\expandafter\newcommand\csname fps@a@#1\endcsname{#2}
	\expandafter\newcommand\csname ftype@a@#1\endcsname{1}
	\expandafter\newcommand\csname ext@a@#1\endcsname{#6}
	\expandafter\newcommand\csname prefix@a@#1\endcsname{#3}
	\newcommand #7{\begin{contentlistingsection}{#8}\@starttoc{#6}\end{contentlistingsection}}
	\expandafter\newcommand\expandafter*\csname l@a@#1\endcsname{\@tocline{2}{0cm}}
	\expandafter\let\csname enda@#1\endcsname\end@float
	\newenvironment{#1}[2][]{%
		\refstepcounter{a@#1}\def\@captiontext{##2}\ifx&##1&\@float{a@#1}\else\@float{a@#1}[##1]\fi#4%
	}{#5\csname enda@#1\endcsname}
}
\makeattachmenttype{figure}{tbp}{Hình}{}{%
	\vspace{0.25cm}\attachmentcaptionbox{\centering\small\attachmentcaption}%
}{lof}{\listoffigures}{Danh sách hình vẽ}
\makeattachmenttype{table}{tbp}{Bảng}{%
	\attachmentcaptionbox{\centering\small\textbf{\attachmentcaption}}\vspace{0.25cm}%
}{}{lot}{\listoftables}{Danh sách bảng}

\renewcommand\footnoterule{\kern-3\p@\hrule\@width.4\columnwidth\kern2.6\p@}
\newcommand\@makefntext[1]{\parindent 1em\noindent\hb@xt@1.8em{\hss\@makefnmark}#1}

\newcommand\bibname{Tài liệu tham khảo}
\newcounter{bibitem}
\renewcommand\thebibitem{\@arabic\c@bibitem}
\newif\if@inthebibliography\@inthebibliographyfalse
\newif\if@inbibsection\@inbibsectionfalse
\newenvironment{thebibliography}[1]{
	\@inthebibliographytrue\settowidth\labelwidth{\@biblabel{#1}}
	\clearpage\noindent\Large\textbf{\bibname}\par\normalsize\vspace{1cm}
}{\@inthebibliographyfalse}
\newenvironment{bibsection}[1]{%
	\if@inthebibliography\else\PackageError{uetgraduation}{\`bibsection\` not in \`thebibliography\`.}{
		A bibliography section needs to be placed in \`thebibliography\` environment.
	}\fi\@inbibsectiontrue%
	\noindent\textbf{#1}
	\list{\@biblabel{\thebibitem}}{
		\leftmargin\labelwidth\advance\leftmargin\labelsep
		\@nmbrlisttrue\def\@listctr{bibitem}
	}%
	\sloppy\clubpenalty 4000\@clubpenalty \clubpenalty\widowpenalty 4000\sfcode`\.\@m
}{\def\@noitemerr{}\endlist\@inbibsectionfalse}
\renewcommand\bibitem[1]{%
	\if@inbibsection\else\PackageError{uetgraduation}{\`bibitem\` not in \`bibsection\`.}{
		A bibliography item needs to be placed in a \`bibsection\` environment.
	}\fi%
	\item\if@filesw\immediate\write\@auxout{\string\bibcite{#1}{\the\value{\@listctr}}}\fi\ignorespaces
}

\mathchardef\dcol="203A % Division colon (:).
\mathchardef\mdot="202E % Multiplication dot (.).
\mathchardef\ngt="2D % Negative sign (-).

% No page numbering for the cover and preamble pages, page numbering will automatically start at the first chapter.
\pagestyle{empty}
\bibliographystyle{plain}

% Prevent overflow of the text column at all costs.
\sloppy

\AtEndDocument{\@ifpackageloaded{hyperref}{}{\pdfextension catalog{/PageLabels<</Nums[%
	0<</S/r>>%
	\the\numexpr\value{firstContentPageIndex}-1\relax<</S/D>>%
]>>/PageLayout/OneColumn>>}}}