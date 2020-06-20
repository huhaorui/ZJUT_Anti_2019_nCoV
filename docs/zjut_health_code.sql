-- version 5.0.2
-- 主机： localhost
-- 生成日期： 2020-06-21 00:10:47
-- 服务器版本： 5.7.30-log

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- 数据库： `zjut_health_code`
--

-- --------------------------------------------------------

--
-- 表的结构 `admin`
--

CREATE TABLE `admin` (
  `id` varchar(16) NOT NULL,
  `level` int(11) NOT NULL,
  `target` int(11) DEFAULT NULL,
  `password` varchar(32) NOT NULL,
  `email` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- 转存表中的数据 `admin`
--

INSERT INTO `admin` (`id`, `level`, `target`, `password`, `email`) VALUES
('000000', 9, NULL, 'a4b2496f50accbf0128aa8ea4f110fbf', '1533144693@qq.com');

-- --------------------------------------------------------

--
-- 表的结构 `captcha`
--

CREATE TABLE `captcha` (
  `session` char(32) DEFAULT NULL,
  `captcha` char(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- 表的结构 `class`
--

CREATE TABLE `class` (
  `id` int(11) NOT NULL,
  `major` int(11) NOT NULL,
  `name` varchar(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- 表的结构 `collage`
--

CREATE TABLE `collage` (
  `id` int(11) NOT NULL,
  `name` varchar(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- 表的结构 `health_code_token`
--

CREATE TABLE `health_code_token` (
  `uid` varchar(16) NOT NULL,
  `token` varchar(64) DEFAULT NULL,
  `used` varchar(8) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- 表的结构 `health_info`
--

CREATE TABLE `health_info` (
  `uid` varchar(12) NOT NULL,
  `tel` varchar(16) NOT NULL,
  `if_danger_14` int(11) NOT NULL,
  `if_abroad_14` int(11) NOT NULL,
  `if_touch_illness` int(11) NOT NULL,
  `if_ill` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `color` varchar(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- 表的结构 `major`
--

CREATE TABLE `major` (
  `id` int(11) NOT NULL,
  `collage` int(11) NOT NULL,
  `name` varchar(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- 表的结构 `password_reset`
--

CREATE TABLE `password_reset` (
  `id` varchar(16) NOT NULL,
  `token` char(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- 表的结构 `punch_record`
--

CREATE TABLE `punch_record` (
  `uid` varchar(16) NOT NULL,
  `date` date NOT NULL,
  `time` time NOT NULL,
  `status` int(11) NOT NULL,
  `color` varchar(8) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- 表的结构 `student`
--

CREATE TABLE `student` (
  `id` varchar(32) NOT NULL,
  `class` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  `person_id` varchar(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- 表的结构 `teacher`
--

CREATE TABLE `teacher` (
  `id` varchar(16) NOT NULL,
  `name` varchar(64) NOT NULL,
  `person_id` varchar(32) NOT NULL,
  `collage` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- 替换视图以便查看 `Teacher_Student`
-- （参见下面的实际视图）
--
CREATE TABLE `Teacher_Student` (
`id` varchar(32)
,`person_id` varchar(32)
,`name` varchar(64)
);

-- --------------------------------------------------------

--
-- 替换视图以便查看 `view_class`
-- （参见下面的实际视图）
--
CREATE TABLE `view_class` (
`id` int(11)
,`collage` varchar(32)
,`major` varchar(32)
,`class` varchar(32)
);

-- --------------------------------------------------------

--
-- 替换视图以便查看 `view_collage`
-- （参见下面的实际视图）
--
CREATE TABLE `view_collage` (
`id` int(11)
,`collage` varchar(32)
);

-- --------------------------------------------------------

--
-- 替换视图以便查看 `view_major`
-- （参见下面的实际视图）
--
CREATE TABLE `view_major` (
`id` int(11)
,`collage` varchar(32)
,`major` varchar(32)
);

-- --------------------------------------------------------

--
-- 替换视图以便查看 `view_person`
-- （参见下面的实际视图）
--
CREATE TABLE `view_person` (
`type` bigint(20)
,`collage` int(11)
,`major` varchar(11)
,`class` varchar(11)
,`id` varchar(32)
,`name` varchar(64)
,`person_id` varchar(32)
);

-- --------------------------------------------------------

--
-- 替换视图以便查看 `view_student`
-- （参见下面的实际视图）
--
CREATE TABLE `view_student` (
`collage` varchar(32)
,`major` varchar(32)
,`class` varchar(32)
,`id` varchar(32)
,`name` varchar(64)
,`person_id` varchar(32)
);

-- --------------------------------------------------------

--
-- 替换视图以便查看 `view_student_full`
-- （参见下面的实际视图）
--
CREATE TABLE `view_student_full` (
`collage` varchar(32)
,`major` varchar(32)
,`class` varchar(32)
,`id` varchar(32)
,`name` varchar(64)
,`person_id` varchar(32)
);

-- --------------------------------------------------------

--
-- 替换视图以便查看 `view_student_raw`
-- （参见下面的实际视图）
--
CREATE TABLE `view_student_raw` (
`collage` int(11)
,`major` int(11)
,`class` int(11)
,`id` varchar(32)
,`name` varchar(64)
,`person_id` varchar(32)
);

-- --------------------------------------------------------

--
-- 替换视图以便查看 `view_teacher`
-- （参见下面的实际视图）
--
CREATE TABLE `view_teacher` (
`collage` varchar(32)
,`id` varchar(16)
,`name` varchar(64)
,`person_id` varchar(32)
);

-- --------------------------------------------------------

--
-- 替换视图以便查看 `view_teacher_student`
-- （参见下面的实际视图）
--
CREATE TABLE `view_teacher_student` (
`id` varchar(32)
,`name` varchar(64)
,`person_id` varchar(32)
);

-- --------------------------------------------------------

--
-- 替换视图以便查看 `view_teacher_student_full`
-- （参见下面的实际视图）
--
CREATE TABLE `view_teacher_student_full` (
`type` varchar(2)
,`collage` varchar(32)
,`major` varchar(32)
,`class` varchar(32)
,`id` varchar(32)
,`name` varchar(64)
,`person_id` varchar(32)
);

-- --------------------------------------------------------

--
-- 视图结构 `Teacher_Student`
--
DROP TABLE IF EXISTS `Teacher_Student`;

CREATE ALGORITHM=UNDEFINED DEFINER=`zjut_health_code`@`%` SQL SECURITY DEFINER VIEW `Teacher_Student`  AS  select `student`.`id` AS `id`,`student`.`person_id` AS `person_id`,`student`.`name` AS `name` from `student` union select `teacher`.`id` AS `id`,`teacher`.`person_id` AS `person_id`,`teacher`.`name` AS `name` from `teacher` ;

-- --------------------------------------------------------

--
-- 视图结构 `view_class`
--
DROP TABLE IF EXISTS `view_class`;

CREATE ALGORITHM=UNDEFINED DEFINER=`zjut_health_code`@`%` SQL SECURITY DEFINER VIEW `view_class`  AS  select `class`.`id` AS `id`,`collage`.`name` AS `collage`,`major`.`name` AS `major`,`class`.`name` AS `class` from ((`class` join `major`) join `collage`) where ((`major`.`collage` = `collage`.`id`) and (`class`.`major` = `major`.`id`)) ;

-- --------------------------------------------------------

--
-- 视图结构 `view_collage`
--
DROP TABLE IF EXISTS `view_collage`;

CREATE ALGORITHM=UNDEFINED DEFINER=`zjut_health_code`@`%` SQL SECURITY DEFINER VIEW `view_collage`  AS  select `collage`.`id` AS `id`,`collage`.`name` AS `collage` from `collage` ;

-- --------------------------------------------------------

--
-- 视图结构 `view_major`
--
DROP TABLE IF EXISTS `view_major`;

CREATE ALGORITHM=UNDEFINED DEFINER=`zjut_health_code`@`%` SQL SECURITY DEFINER VIEW `view_major`  AS  select `major`.`id` AS `id`,`collage`.`name` AS `collage`,`major`.`name` AS `major` from (`major` join `collage`) where (`major`.`collage` = `collage`.`id`) ;

-- --------------------------------------------------------

--
-- 视图结构 `view_person`
--
DROP TABLE IF EXISTS `view_person`;

CREATE ALGORITHM=UNDEFINED DEFINER=`zjut_health_code`@`%` SQL SECURITY DEFINER VIEW `view_person`  AS  select 0 AS `type`,`collage`.`id` AS `collage`,`major`.`id` AS `major`,`class`.`id` AS `class`,`student`.`id` AS `id`,`student`.`name` AS `name`,`student`.`person_id` AS `person_id` from (((`student` join `class`) join `major`) join `collage`) where ((`student`.`class` = `class`.`id`) and (`class`.`major` = `major`.`id`) and (`major`.`collage` = `collage`.`id`)) union select 1 AS `type`,`collage`.`id` AS `collage`,'' AS `major`,'' AS `class`,`teacher`.`id` AS `id`,`teacher`.`name` AS `name`,`teacher`.`person_id` AS `person_id` from (`collage` join `teacher`) where (`teacher`.`collage` = `collage`.`id`) ;

-- --------------------------------------------------------

--
-- 视图结构 `view_student`
--
DROP TABLE IF EXISTS `view_student`;

CREATE ALGORITHM=UNDEFINED DEFINER=`zjut_health_code`@`%` SQL SECURITY DEFINER VIEW `view_student`  AS  select `collage`.`name` AS `collage`,`major`.`name` AS `major`,`class`.`name` AS `class`,`student`.`id` AS `id`,`student`.`name` AS `name`,`student`.`person_id` AS `person_id` from (((`collage` join `major`) join `class`) join `student`) where ((`class`.`id` = `student`.`class`) and (`major`.`id` = `class`.`major`) and (`collage`.`id` = `major`.`collage`)) ;

-- --------------------------------------------------------

--
-- 视图结构 `view_student_full`
--
DROP TABLE IF EXISTS `view_student_full`;

CREATE ALGORITHM=UNDEFINED DEFINER=`zjut_health_code`@`%` SQL SECURITY DEFINER VIEW `view_student_full`  AS  select `collage`.`name` AS `collage`,`major`.`name` AS `major`,`class`.`name` AS `class`,`student`.`id` AS `id`,`student`.`name` AS `name`,`student`.`person_id` AS `person_id` from (((`student` join `class`) join `major`) join `collage`) where ((`student`.`class` = `class`.`id`) and (`class`.`major` = `major`.`id`) and (`major`.`collage` = `collage`.`id`)) ;

-- --------------------------------------------------------

--
-- 视图结构 `view_student_raw`
--
DROP TABLE IF EXISTS `view_student_raw`;

CREATE ALGORITHM=UNDEFINED DEFINER=`zjut_health_code`@`%` SQL SECURITY DEFINER VIEW `view_student_raw`  AS  select `collage`.`id` AS `collage`,`major`.`id` AS `major`,`class`.`id` AS `class`,`student`.`id` AS `id`,`student`.`name` AS `name`,`student`.`person_id` AS `person_id` from (((`student` join `class`) join `major`) join `collage`) where ((`student`.`class` = `class`.`id`) and (`class`.`major` = `major`.`id`) and (`major`.`collage` = `collage`.`id`)) ;

-- --------------------------------------------------------

--
-- 视图结构 `view_teacher`
--
DROP TABLE IF EXISTS `view_teacher`;

CREATE ALGORITHM=UNDEFINED DEFINER=`zjut_health_code`@`%` SQL SECURITY DEFINER VIEW `view_teacher`  AS  select `collage`.`name` AS `collage`,`teacher`.`id` AS `id`,`teacher`.`name` AS `name`,`teacher`.`person_id` AS `person_id` from (`collage` join `teacher`) where (`teacher`.`collage` = `collage`.`id`) ;

-- --------------------------------------------------------

--
-- 视图结构 `view_teacher_student`
--
DROP TABLE IF EXISTS `view_teacher_student`;

CREATE ALGORITHM=UNDEFINED DEFINER=`zjut_health_code`@`%` SQL SECURITY DEFINER VIEW `view_teacher_student`  AS  select `student`.`id` AS `id`,`student`.`name` AS `name`,`student`.`person_id` AS `person_id` from `student` union select `teacher`.`id` AS `id`,`teacher`.`name` AS `name`,`teacher`.`person_id` AS `person_id` from `teacher` ;

-- --------------------------------------------------------

--
-- 视图结构 `view_teacher_student_full`
--
DROP TABLE IF EXISTS `view_teacher_student_full`;

CREATE ALGORITHM=UNDEFINED DEFINER=`zjut_health_code`@`%` SQL SECURITY DEFINER VIEW `view_teacher_student_full`  AS  select '学生' AS `type`,`view_student`.`collage` AS `collage`,`view_student`.`major` AS `major`,`view_student`.`class` AS `class`,`view_student`.`id` AS `id`,`view_student`.`name` AS `name`,`view_student`.`person_id` AS `person_id` from `view_student` union select '教师' AS `type`,`view_teacher`.`collage` AS `collage`,'' AS `major`,'' AS `class`,`view_teacher`.`id` AS `id`,`view_teacher`.`name` AS `name`,`view_teacher`.`person_id` AS `person_id` from `view_teacher` ;

--
-- 转储表的索引
--

--
-- 表的索引 `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `admin_id_uindex` (`id`),
  ADD KEY `admin_collage_fk` (`target`);

--
-- 表的索引 `class`
--
ALTER TABLE `class`
  ADD PRIMARY KEY (`id`),
  ADD KEY `class_major_fk` (`major`);

--
-- 表的索引 `collage`
--
ALTER TABLE `collage`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `health_code_token`
--
ALTER TABLE `health_code_token`
  ADD PRIMARY KEY (`uid`),
  ADD UNIQUE KEY `uid` (`uid`);

--
-- 表的索引 `health_info`
--
ALTER TABLE `health_info`
  ADD PRIMARY KEY (`uid`),
  ADD UNIQUE KEY `health_info_uid_uindex` (`uid`);

--
-- 表的索引 `major`
--
ALTER TABLE `major`
  ADD PRIMARY KEY (`id`),
  ADD KEY `major_collage_fk` (`collage`);

--
-- 表的索引 `punch_record`
--
ALTER TABLE `punch_record`
  ADD PRIMARY KEY (`uid`,`date`);

--
-- 表的索引 `student`
--
ALTER TABLE `student`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `student_id_uindex` (`id`),
  ADD KEY `student_class_fk` (`class`);

--
-- 表的索引 `teacher`
--
ALTER TABLE `teacher`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `teacher_id_uindex` (`id`),
  ADD KEY `teacher_collage_fk` (`collage`);

--
-- 在导出的表使用AUTO_INCREMENT
--

--
-- 使用表AUTO_INCREMENT `class`
--
ALTER TABLE `class`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1755;

--
-- 使用表AUTO_INCREMENT `collage`
--
ALTER TABLE `collage`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=898;

--
-- 使用表AUTO_INCREMENT `major`
--
ALTER TABLE `major`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=706;

--
-- 限制导出的表
--

--
-- 限制表 `admin`
--
ALTER TABLE `admin`
  ADD CONSTRAINT `admin_collage_fk` FOREIGN KEY (`target`) REFERENCES `collage` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- 限制表 `major`
--
ALTER TABLE `major`
  ADD CONSTRAINT `major_collage_fk` FOREIGN KEY (`collage`) REFERENCES `collage` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- 限制表 `student`
--
ALTER TABLE `student`
  ADD CONSTRAINT `student_class_fk` FOREIGN KEY (`class`) REFERENCES `class` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- 限制表 `teacher`
--
ALTER TABLE `teacher`
  ADD CONSTRAINT `teacher_collage_fk` FOREIGN KEY (`collage`) REFERENCES `collage` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
