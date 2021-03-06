% !Mode:: "TeX:UTF-8"
% University of Science and Technology Beijing Thesis Template
% For Bachelor Master and Doctor
%
%   Version
%       0.1
%   Created
%       2015.12.21 by JeffHugh@USTB
%   Last Modified
%       2015.12.21 by JeffHugh@USTB
%

%%%%%%%%%% class clarification %%%%%%%%%%
%
\NeedsTeXFormat{LaTeX2e}[2007/10/19]
\ProvidesClass{USTBThesis}[2015/12/21 v0.1 USTBthesis document class]

%定义模板学位选项
\newif\ifustb@master\ustb@masterfalse
\newif\ifustb@doctor\ustb@doctorfalse
\DeclareOption{master}{\ustb@mastertrue}
\DeclareOption{doctor}{\ustb@doctortrue}
% 其余选项传递给ctexbook
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{ctexbook}}
\ProcessOptions\relax
% 引用ctexbook及基本设置
\LoadClass[cs4size,a4paper,fancyhdr,twoside]{ctexbook}[2007/10/19]

\usepackage{ulem}               %下划线强调
\usepackage{fancyhdr}           %页眉页脚
\usepackage{mathptmx}   %是英文字体为Times New Roman
\usepackage{tabu}  %表格
\usepackage{booktabs}   %表格线宏包
\usepackage{tabularx}   %调整表格列宽
\usepackage{multirow}   %表格合并
\usepackage{array}      %数组宏包，用于表格宽度
\usepackage{multicol}   %表格合并
\usepackage{longtable}  %表格合并
\usepackage{rotating}   %表格合并
\usepackage[top=30mm, bottom=20mm, left=30mm, right=30mm]{geometry}  %页面边距设置
\usepackage{graphicx}   %插图
\usepackage{amsmath}    %公式换行
\usepackage{titletoc}   %目录
\usepackage{listings}   %插入代码
\usepackage{texnames}   %TeX家族标识符
\usepackage[super,square,sort&compress]{natbib}   %参考文献设置
\usepackage{float}      %表格位置
\usepackage{setspace}   %调整行距
\usepackage{lastpage}   %得到论文页数
\usepackage{subfig}
%\usepackage{CJKvert}    %直排文字
%%%%%%%%%%%%%%%%%%%%%%%%%论文信息%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%学校
\def\UniversityCN{北京科技大学}
\def\UniversityEN{University of Science and Technology Beijing}
\newcommand{\university}[2]{%
    \def\UniversityCN{#1}
    \def\UniversityEN{#2}
}

%学院
\def\SchoolCN{土木与环境工程学院}
\def\SchoolEN{School of Civil and Environmental Engineering}
\newcommand{\school}[2]{%
    \def\SchoolCN{#1}
   \def\SchoolEN{#2}
}

%专业
\def\MajorCN{}
\def\MajorEN{}
\newcommand{\major}[2]{%
    \def\MajorCN{#1}
    \def\MajorEN{#2}
}

%学位
\def\degreecn{}
\def\degreeen{}
\newcommand{\degree}[2]{%
    \def\degreecn{#1}
    \def\degreeen{#2}
}
\ifustb@doctor
    \degree{博士}{Doctor of Philosophy}
\else
    \ifustb@master
        \degree{硕士}{Master}
    \fi
\fi

%论文标题
\def\ThesisTitleCN{}
\def\ThesisTitleEN{}
\def\ThesisSubTitleCN{}
\def\ThesisSubTitleEN{}
\newcommand{\thesistitle}[4]{%
    \def\ThesisTitleCN{#1}
    \def\ThesisTitleEN{#2}
    \def\ThesisSubTitleCN{#3}
    \def\ThesisSubTitleEN{#4}
}

%作者
\def\AuthorCN{}
\def\AuthorEN{}
\newcommand{\thesisauthor}[2]{%
    \def\AuthorCN{#1}
    \def\AuthorEN{#2}
}

%学号
\def\StudentID{}
\newcommand{\authorid}[1]{%
    \def\StudentID{#1}
}

% 指导老师
\def\TeacherCN{}
\def\TeacherEN{}
\def\TeacherDepartment{}
\def\TeacherJobtitle{}
\newcommand{\teacher}[4]{%
    \def\TeacherCN{#1}
    \def\TeacherEN{#2}
    \def\TeacherDepartment{#3}
    \def\TeacherJobtitle{#4}
}

% 副指导老师
\def\SubTeacherCN{}
\def\SubTeacherEN{}
\def\SubTeacherDepartment{}
\def\SubTeacherJobtitle{}
\newcommand{\subteacher}[4]{%
    \def\SubTeacherCN{#1}
    \def\SubTeacherEN{#2}
    \def\SubTeacherDepartment{#3}
    \def\SubTeacherJobtitle{#4}
}

% 分类号
\def\ThesisCategory{}
\newcommand{\category}[1]{%
    \def\ThesisCategory{#1}
}

% 论文提交日期
\def\ThesisYear{}
\def\ThesisMonth{}
\def\ThesisDay{}
\newcommand{\thesisdate}[3]{%
    \def\ThesisYear{#1}
    \def\ThesisMonth{#2}
    \def\ThesisDay{#3}
}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%定义标题格式%%%%%%%%%%%%%%%%%%%%%%%%%%
\CTEXsetup[number={\arabic{chapter}}]{chapter}
\CTEXsetup[name={,}]{chapter}
\CTEXsetup[format={\raggedright}]{chapter}
\CTEXsetup[format={\Large\bf}]{section}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%公式、图名和表名用“2-3”形式表示
makeatletter
\numberwithin{figure}{chapter}
\numberwithin{table}{chapter}
\renewcommand{\thefigure}{\thechapter-\arabic{figure}}
\renewcommand{\thetable}{\thechapter-\arabic{table}}
\@addtoreset{equation}{section}
\makeatother
\captionsetup{font=small}
\renewcommand\theequation{\arabic{section}-\arabic{equation}}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%目录%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\renewcommand{\contentsname}{\centering 目\quad 录}
\titlecontents{chapter}[0pt]{\heiti\zihao{-4}}{\thecontentslabel\ }{}
        {\hspace{.5em}\titlerule*[4pt]{$\cdot$}\contentspage}
\titlecontents{section}[2em]{\vspace{0.1\baselineskip}\songti\zihao{-4}}{\thecontentslabel\ }{}
        {\hspace{.5em}\titlerule*[4pt]{$\cdot$}\contentspage}
\titlecontents{subsection}[4em]{\vspace{0.1\baselineskip}\songti\zihao{-4}}{\thecontentslabel\ }{}
        {\hspace{.5em}\titlerule*[4pt]{$\cdot$}\contentspage}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
