% vim:syntax=tex
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{uetgraduation}[2024/05/17
	LaTeX document class for Vietnam National University, University of Engineering and Technology (VNU-UET)
	graduation documents.
]

\RequirePackage{amsmath}
\RequirePackage{etoolbox}
\RequirePackage[fontsize=13pt]{fontsize}
\RequirePackage[a4paper,twoside,inner=3cm,outer=2cm,top=2.5cm,bottom=2cm,includefoot,footskip=1cm]{geometry}
\RequirePackage{graphicx}
\RequirePackage{icomma}
\RequirePackage{indentfirst}
\RequirePackage{mathspec}
\RequirePackage{siunitx}
\RequirePackage{tikz}
	\usetikzlibrary{calc}

\lefthyphenmin 64
\frenchspacing
\setallmainfonts{Times New Roman}
\pagenumbering{arabic}

\setlength\parindent{1cm}
\setlength\parskip{6pt}
\setlength\leftmargini{1cm}
\leftmargin\leftmargini
\setlength\leftmarginii{\leftmargini}
\setlength\leftmarginiii{\leftmargini}
\setlength\leftmarginiv{\leftmargini}
\setlength\leftmarginv{\leftmargini}
\setlength\leftmarginvi{\leftmargini}
\setlength\labelsep{0.25cm}
\setlength\labelwidth{\leftmargini}
\addtolength\labelwidth{-\labelsep}
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
\newcommand\setfontsize[1]{\setlength\customfontsize{#1}\fontsize{\customfontsize}{1.2\customfontsize}\selectfont}

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
}{\cleardoublepage\normalsize}
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
	\setlength\parindent{0cm}\setfontsize{12pt}{\centering\textbf{\MakeUppercase{#1}}\par}\vspace{1cm}
}{\cleardoublepage\normalsize}

\newif\if@incontentlisting\@incontentlistingfalse
\newenvironment{contentlisting}{\@incontentlistingtrue}{\@incontentlistingfalse\cleardoublepage}

\renewcommand\numberline[2]{#1 #2}
\newcommand\@tocline[4]{\ifnum #1>\c@tocdepth\else
	\vskip\z@\@plus.2\p@{%
		\raggedright\parindent #2\hangindent #2\rightskip 1cm\parfillskip -1cm\interlinepenalty\@M\leavevmode #3%
		\leaders\hbox{$\m@th\mkern0.5mu\hbox{.}\mkern0.5mu$}\hfill #4\par%
	}
\fi}
\setcounter{tocdepth}{3}
\newcommand\@contentlisting[2]{%
	\if@incontentlisting\else\PackageError{uetgraduation}{Content listing not in \`contentlisting\` environment.}{
		To ensure consistency, place all content listing sections into the \`contentlisting\` environment.
	}\fi%
	\noindent\Large\textbf{#1}\par\vspace{1cm}\normalsize\@starttoc{#2}
}
\newcommand\tableofcontents{\@contentlisting{Mục lục}{toc}\clearpage}
\newcommand*\l@chapter{\@tocline{1}{0cm}}
\newcommand*\l@section{\@tocline{2}{1cm}}
\newcommand*\l@subsection{\@tocline{3}{2cm}}

\newcounter{chapter}
\newcounter{section}[chapter]
\newcounter{subsection}[section]
\renewcommand\thechapter{\@arabic\c@chapter}
\renewcommand\thesection{\thechapter.\@arabic\c@section}
\renewcommand\thesubsection{\thesection.\@arabic\c@subsection}
\newcommand\chapter[1]{%
	\cleardoublepage\stepcounter{chapter}\ifnum\c@chapter=1\pagestyle{plain}\setcounter{page}{1}\fi
	\addcontentsline{toc}{chapter}{\protect\numberline{Chương \thechapter.}{#1}}
	\noindent\large\textbf{Chương \thechapter.}\par
	\noindent\huge#1\par\vspace{2cm}\normalsize%
}
\newcommand\section[1]{%
	\stepcounter{section}\addcontentsline{toc}{section}{\protect\numberline{\thesection.}{#1}}
	\noindent\Large\textbf{\thesection. #1}\par\normalsize%
}
\newcommand\subsection[1]{%
	\stepcounter{subsection}\addcontentsline{toc}{subsection}{\protect\numberline{\thesubsection.}{#1}}
	\noindent\large\textbf{\thesubsection. #1}\par\normalsize%
}
% Arguments: attachment identifier, number prefix, list identifier, list command, list title.
\newcommand\makeattachmenttype[5]{
	\newcounter{#1}[chapter]
	\expandafter\renewcommand\csname the#1\endcsname{\thechapter.\@arabic\csname c@#1\endcsname}
	\expandafter\newcommand\csname #1caption\endcsname[1]{%
		\stepcounter{#1}\addcontentsline{#3}{#1}{\protect\numberline{#2 \csname the#1\endcsname.}{##1}}%
		#2 \csname the#1\endcsname. ##1%
	}
	\newcommand #4{\@contentlisting{#5}{#3}}
	\expandafter\newcommand\expandafter*\csname l@#1\endcsname{\@tocline{1}{0cm}}
}
\makeattachmenttype{figure}{Hình}{lof}{\listoffigures}{Danh sách hình vẽ}
\makeattachmenttype{table}{Bảng}{lot}{\listoftables}{Danh sách bảng}

\newcommand\bibname{Tài liệu tham khảo}
\newenvironment{thebibliography}[1]{%
	\cleardoublepage\Large\textbf{\bibname}\par
	\normalsize\list{\@biblabel{\@arabic\c@enumiv}}{
		\settowidth\labelwidth{\@biblabel{#1}}
		\leftmargin\labelwidth
		\advance\leftmargin\labelsep
		\usecounter{enumiv}%
		\let\p@enumiv\@empty
		\renewcommand\theenumiv{\@arabic\c@enumiv}
	}%
	\sloppy
	\clubpenalty 4000
	\@clubpenalty \clubpenalty
	\widowpenalty 4000%
	\sfcode`\.\@m
}{\def\@noitemerr{\PackageWarning{Empty bibliography environment.}}\endlist}

\mathchardef\dcol="203A % Division colon (:).
\mathchardef\mdot="202E % Multiplication dot (.).
\mathchardef\ngt="2D % Negative sign (-).

% No page numbering for the cover and preamble pages, page numbering will automatically start at the first chapter.
\pagestyle{empty}
\bibliographystyle{plain}