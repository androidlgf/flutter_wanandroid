import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../res/dimens.dart';
import '../res/colors.dart';

/// 间隔
class Gaps {
  /// 水平间隔
  static Widget hGap3 = SizedBox(width: Dimens.gap_dp3);
  static Widget hGap4 = SizedBox(width: Dimens.gap_dp4);
  static Widget hGap5 = SizedBox(width: Dimens.gap_dp5);
  static Widget hGap6 = SizedBox(width: Dimens.gap_dp6);
  static Widget hGap8 = SizedBox(width: Dimens.gap_dp8);
  static Widget hGap10 = SizedBox(width: Dimens.gap_dp10);
  static Widget hGap12 = SizedBox(width: Dimens.gap_dp12);
  static Widget hGap15 = SizedBox(width: Dimens.gap_dp15);
  static Widget hGap16 = SizedBox(width: Dimens.gap_dp16);
  static Widget hGap20 = SizedBox(width: Dimens.gap_dp20);
  static Widget hGap24 = SizedBox(width: Dimens.gap_dp24);
  static Widget hGap40 = SizedBox(width: Dimens.gap_dp40);

  /// 垂直间隔
  static Widget vGap3 = SizedBox(height: Dimens.gap_dp3);
  static Widget vGap4 = SizedBox(height: Dimens.gap_dp4);
  static Widget vGap5 = SizedBox(height: Dimens.gap_dp5);
  static Widget vGap6 = SizedBox(height: Dimens.gap_dp6);
  static Widget vGap8 = SizedBox(height: Dimens.gap_dp8);
  static Widget vGap10 = SizedBox(height: Dimens.gap_dp10);
  static Widget vGap12 = SizedBox(height: Dimens.gap_dp12);
  static Widget vGap15 = SizedBox(height: Dimens.gap_dp15);
  static Widget vGap16 = SizedBox(height: Dimens.gap_dp16);
  static Widget vGap20 = SizedBox(height: Dimens.gap_dp20);
  static Widget vGap24 = SizedBox(height: Dimens.gap_dp24);
  static Widget vGap25 = SizedBox(height: Dimens.gap_dp25);
  static Widget vGap40 = SizedBox(height: Dimens.gap_dp40);
  static Widget vGap60 = SizedBox(height: Dimens.gap_dp60);

  static Widget hGap(double w) {
    return SizedBox(width: w);
  }

  static Widget vGap(double h) {
    return SizedBox(height: h);
  }

  static Widget line = Container(height: 0.6, color: Color(0xFFEEEEEE));
}

/// 屏幕宽高 文字大小适配
class Screen {
  /// 根据宽度适配
  static double wScreen1 = ScreenUtil().setWidth(1.0);
  static double wScreen2 = ScreenUtil().setWidth(2.0);
  static double wScreen3 = ScreenUtil().setWidth(3.0);
  static double wScreen4 = ScreenUtil().setWidth(4.0);
  static double wScreen5 = ScreenUtil().setWidth(5.0);
  static double wScreen6 = ScreenUtil().setWidth(6.0);
  static double wScreen7 = ScreenUtil().setWidth(7.0);
  static double wScreen8 = ScreenUtil().setWidth(8.0);
  static double wScreen9 = ScreenUtil().setWidth(9.0);
  static double wScreen10 = ScreenUtil().setWidth(10.0);
  static double wScreen11 = ScreenUtil().setWidth(11.0);
  static double wScreen12 = ScreenUtil().setWidth(12.0);
  static double wScreen13 = ScreenUtil().setWidth(13.0);
  static double wScreen14 = ScreenUtil().setWidth(14.0);
  static double wScreen15 = ScreenUtil().setWidth(15.0);
  static double wScreen16 = ScreenUtil().setWidth(16.0);
  static double wScreen17 = ScreenUtil().setWidth(17.0);
  static double wScreen18 = ScreenUtil().setWidth(18.0);
  static double wScreen19 = ScreenUtil().setWidth(19.0);
  static double wScreen20 = ScreenUtil().setWidth(20.0);

  static double wScreen21 = ScreenUtil().setWidth(21.0);
  static double wScreen22 = ScreenUtil().setWidth(22.0);
  static double wScreen23 = ScreenUtil().setWidth(23.0);
  static double wScreen24 = ScreenUtil().setWidth(24.0);
  static double wScreen25 = ScreenUtil().setWidth(25.0);
  static double wScreen26 = ScreenUtil().setWidth(26.0);
  static double wScreen27 = ScreenUtil().setWidth(27.0);
  static double wScreen28 = ScreenUtil().setWidth(28.0);
  static double wScreen29 = ScreenUtil().setWidth(29.0);
  static double wScreen30 = ScreenUtil().setWidth(30.0);
  static double wScreen31 = ScreenUtil().setWidth(31.0);
  static double wScreen32 = ScreenUtil().setWidth(32.0);
  static double wScreen33 = ScreenUtil().setWidth(33.0);
  static double wScreen34 = ScreenUtil().setWidth(34.0);
  static double wScreen35 = ScreenUtil().setWidth(35.0);
  static double wScreen36 = ScreenUtil().setWidth(36.0);
  static double wScreen37 = ScreenUtil().setWidth(37.0);
  static double wScreen38 = ScreenUtil().setWidth(38.0);
  static double wScreen39 = ScreenUtil().setWidth(39.0);
  static double wScreen40 = ScreenUtil().setWidth(40.0);

  static double wScreen41 = ScreenUtil().setWidth(41.0);
  static double wScreen42 = ScreenUtil().setWidth(42.0);
  static double wScreen43 = ScreenUtil().setWidth(43.0);
  static double wScreen44 = ScreenUtil().setWidth(44.0);
  static double wScreen45 = ScreenUtil().setWidth(45.0);
  static double wScreen46 = ScreenUtil().setWidth(46.0);
  static double wScreen47 = ScreenUtil().setWidth(47.0);
  static double wScreen48 = ScreenUtil().setWidth(48.0);
  static double wScreen49 = ScreenUtil().setWidth(49.0);
  static double wScreen50 = ScreenUtil().setWidth(50.0);
  static double wScreen51 = ScreenUtil().setWidth(51.0);
  static double wScreen52 = ScreenUtil().setWidth(52.0);
  static double wScreen53 = ScreenUtil().setWidth(53.0);
  static double wScreen54 = ScreenUtil().setWidth(54.0);
  static double wScreen55 = ScreenUtil().setWidth(55.0);
  static double wScreen56 = ScreenUtil().setWidth(56.0);
  static double wScreen57 = ScreenUtil().setWidth(57.0);
  static double wScreen58 = ScreenUtil().setWidth(58.0);
  static double wScreen59 = ScreenUtil().setWidth(59.0);
  static double wScreen60 = ScreenUtil().setWidth(60.0);

  static double wScreen61 = ScreenUtil().setWidth(61.0);
  static double wScreen62 = ScreenUtil().setWidth(62.0);
  static double wScreen63 = ScreenUtil().setWidth(63.0);
  static double wScreen64 = ScreenUtil().setWidth(64.0);
  static double wScreen65 = ScreenUtil().setWidth(65.0);
  static double wScreen66 = ScreenUtil().setWidth(66.0);
  static double wScreen67 = ScreenUtil().setWidth(67.0);
  static double wScreen68 = ScreenUtil().setWidth(68.0);
  static double wScreen69 = ScreenUtil().setWidth(69.0);
  static double wScreen70 = ScreenUtil().setWidth(70.0);
  static double wScreen71 = ScreenUtil().setWidth(71.0);
  static double wScreen72 = ScreenUtil().setWidth(72.0);
  static double wScreen73 = ScreenUtil().setWidth(73.0);
  static double wScreen74 = ScreenUtil().setWidth(74.0);
  static double wScreen75 = ScreenUtil().setWidth(75.0);
  static double wScreen76 = ScreenUtil().setWidth(76.0);
  static double wScreen77 = ScreenUtil().setWidth(77.0);
  static double wScreen78 = ScreenUtil().setWidth(78.0);
  static double wScreen79 = ScreenUtil().setWidth(79.0);
  static double wScreen80 = ScreenUtil().setWidth(80.0);

  static double wScreen81 = ScreenUtil().setWidth(81.0);
  static double wScreen82 = ScreenUtil().setWidth(82.0);
  static double wScreen83 = ScreenUtil().setWidth(83.0);
  static double wScreen84 = ScreenUtil().setWidth(84.0);
  static double wScreen85 = ScreenUtil().setWidth(85.0);
  static double wScreen86 = ScreenUtil().setWidth(86.0);
  static double wScreen87 = ScreenUtil().setWidth(87.0);
  static double wScreen88 = ScreenUtil().setWidth(88.0);
  static double wScreen89 = ScreenUtil().setWidth(89.0);
  static double wScreen90 = ScreenUtil().setWidth(90.0);
  static double wScreen91 = ScreenUtil().setWidth(91.0);
  static double wScreen92 = ScreenUtil().setWidth(92.0);
  static double wScreen93 = ScreenUtil().setWidth(93.0);
  static double wScreen94 = ScreenUtil().setWidth(94.0);
  static double wScreen95 = ScreenUtil().setWidth(95.0);
  static double wScreen96 = ScreenUtil().setWidth(96.0);
  static double wScreen97 = ScreenUtil().setWidth(97.0);
  static double wScreen98 = ScreenUtil().setWidth(98.0);
  static double wScreen99 = ScreenUtil().setWidth(99.0);
  static double wScreen100 = ScreenUtil().setWidth(100.0);

  static double wScreen101 = ScreenUtil().setWidth(101.0);
  static double wScreen102 = ScreenUtil().setWidth(102.0);
  static double wScreen103 = ScreenUtil().setWidth(103.0);
  static double wScreen104 = ScreenUtil().setWidth(104.0);
  static double wScreen105 = ScreenUtil().setWidth(105.0);
  static double wScreen106 = ScreenUtil().setWidth(106.0);
  static double wScreen107 = ScreenUtil().setWidth(107.0);
  static double wScreen108 = ScreenUtil().setWidth(108.0);
  static double wScreen109 = ScreenUtil().setWidth(109.0);
  static double wScreen110 = ScreenUtil().setWidth(110.0);
  static double wScreen111 = ScreenUtil().setWidth(111.0);
  static double wScreen112 = ScreenUtil().setWidth(112.0);
  static double wScreen113 = ScreenUtil().setWidth(113.0);
  static double wScreen114 = ScreenUtil().setWidth(114.0);
  static double wScreen115 = ScreenUtil().setWidth(115.0);
  static double wScreen116 = ScreenUtil().setWidth(116.0);
  static double wScreen117 = ScreenUtil().setWidth(117.0);
  static double wScreen118 = ScreenUtil().setWidth(118.0);
  static double wScreen119 = ScreenUtil().setWidth(119.0);
  static double wScreen120 = ScreenUtil().setWidth(120.0);

  static double wScreen121 = ScreenUtil().setWidth(121.0);
  static double wScreen122 = ScreenUtil().setWidth(122.0);
  static double wScreen123 = ScreenUtil().setWidth(123.0);
  static double wScreen124 = ScreenUtil().setWidth(124.0);
  static double wScreen125 = ScreenUtil().setWidth(125.0);
  static double wScreen126 = ScreenUtil().setWidth(126.0);
  static double wScreen127 = ScreenUtil().setWidth(127.0);
  static double wScreen128 = ScreenUtil().setWidth(128.0);
  static double wScreen129 = ScreenUtil().setWidth(129.0);
  static double wScreen130 = ScreenUtil().setWidth(130.0);
  static double wScreen131 = ScreenUtil().setWidth(131.0);
  static double wScreen132 = ScreenUtil().setWidth(132.0);
  static double wScreen133 = ScreenUtil().setWidth(133.0);
  static double wScreen134 = ScreenUtil().setWidth(134.0);
  static double wScreen135 = ScreenUtil().setWidth(135.0);
  static double wScreen136 = ScreenUtil().setWidth(136.0);
  static double wScreen137 = ScreenUtil().setWidth(137.0);
  static double wScreen138 = ScreenUtil().setWidth(138.0);
  static double wScreen139 = ScreenUtil().setWidth(139.0);
  static double wScreen140 = ScreenUtil().setWidth(140.0);

  static double wScreen151 = ScreenUtil().setWidth(151.0);
  static double wScreen152 = ScreenUtil().setWidth(152.0);
  static double wScreen153 = ScreenUtil().setWidth(153.0);
  static double wScreen154 = ScreenUtil().setWidth(154.0);
  static double wScreen155 = ScreenUtil().setWidth(155.0);
  static double wScreen156 = ScreenUtil().setWidth(156.0);
  static double wScreen157 = ScreenUtil().setWidth(157.0);
  static double wScreen158 = ScreenUtil().setWidth(158.0);
  static double wScreen159 = ScreenUtil().setWidth(159.0);
  static double wScreen160 = ScreenUtil().setWidth(160.0);
  static double wScreen161 = ScreenUtil().setWidth(161.0);
  static double wScreen162 = ScreenUtil().setWidth(162.0);
  static double wScreen163 = ScreenUtil().setWidth(163.0);
  static double wScreen164 = ScreenUtil().setWidth(164.0);
  static double wScreen165 = ScreenUtil().setWidth(165.0);
  static double wScreen166 = ScreenUtil().setWidth(166.0);
  static double wScreen167 = ScreenUtil().setWidth(167.0);
  static double wScreen168 = ScreenUtil().setWidth(168.0);
  static double wScreen169 = ScreenUtil().setWidth(169.0);
  static double wScreen170 = ScreenUtil().setWidth(170.0);

  static double wScreen181 = ScreenUtil().setWidth(181.0);
  static double wScreen182 = ScreenUtil().setWidth(182.0);
  static double wScreen183 = ScreenUtil().setWidth(183.0);
  static double wScreen184 = ScreenUtil().setWidth(184.0);
  static double wScreen185 = ScreenUtil().setWidth(185.0);
  static double wScreen186 = ScreenUtil().setWidth(186.0);
  static double wScreen187 = ScreenUtil().setWidth(187.0);
  static double wScreen188 = ScreenUtil().setWidth(188.0);
  static double wScreen189 = ScreenUtil().setWidth(189.0);
  static double wScreen190 = ScreenUtil().setWidth(190.0);
  static double wScreen191 = ScreenUtil().setWidth(191.0);
  static double wScreen192 = ScreenUtil().setWidth(192.0);
  static double wScreen193 = ScreenUtil().setWidth(193.0);
  static double wScreen194 = ScreenUtil().setWidth(194.0);
  static double wScreen195 = ScreenUtil().setWidth(195.0);
  static double wScreen196 = ScreenUtil().setWidth(196.0);
  static double wScreen197 = ScreenUtil().setWidth(197.0);
  static double wScreen198 = ScreenUtil().setWidth(198.0);
  static double wScreen199 = ScreenUtil().setWidth(199.0);
  static double wScreen200 = ScreenUtil().setWidth(200.0);

  static double wScreen201 = ScreenUtil().setWidth(201.0);
  static double wScreen202 = ScreenUtil().setWidth(202.0);
  static double wScreen203 = ScreenUtil().setWidth(203.0);
  static double wScreen204 = ScreenUtil().setWidth(204.0);
  static double wScreen205 = ScreenUtil().setWidth(205.0);
  static double wScreen206 = ScreenUtil().setWidth(206.0);
  static double wScreen207 = ScreenUtil().setWidth(207.0);
  static double wScreen208 = ScreenUtil().setWidth(208.0);
  static double wScreen209 = ScreenUtil().setWidth(209.0);
  static double wScreen210 = ScreenUtil().setWidth(210.0);
  static double wScreen211 = ScreenUtil().setWidth(211.0);
  static double wScreen212 = ScreenUtil().setWidth(212.0);
  static double wScreen213 = ScreenUtil().setWidth(213.0);
  static double wScreen214 = ScreenUtil().setWidth(214.0);
  static double wScreen215 = ScreenUtil().setWidth(215.0);
  static double wScreen216 = ScreenUtil().setWidth(216.0);
  static double wScreen217 = ScreenUtil().setWidth(217.0);
  static double wScreen218 = ScreenUtil().setWidth(218.0);
  static double wScreen219 = ScreenUtil().setWidth(219.0);
  static double wScreen220 = ScreenUtil().setWidth(220.0);

  static double wScreen221 = ScreenUtil().setWidth(221.0);
  static double wScreen222 = ScreenUtil().setWidth(222.0);
  static double wScreen223 = ScreenUtil().setWidth(223.0);
  static double wScreen224 = ScreenUtil().setWidth(224.0);
  static double wScreen225 = ScreenUtil().setWidth(225.0);
  static double wScreen226 = ScreenUtil().setWidth(226.0);
  static double wScreen227 = ScreenUtil().setWidth(227.0);
  static double wScreen228 = ScreenUtil().setWidth(228.0);
  static double wScreen229 = ScreenUtil().setWidth(229.0);
  static double wScreen230 = ScreenUtil().setWidth(230.0);
  static double wScreen231 = ScreenUtil().setWidth(231.0);
  static double wScreen232 = ScreenUtil().setWidth(232.0);
  static double wScreen233 = ScreenUtil().setWidth(233.0);
  static double wScreen234 = ScreenUtil().setWidth(234.0);
  static double wScreen235 = ScreenUtil().setWidth(235.0);
  static double wScreen236 = ScreenUtil().setWidth(236.0);
  static double wScreen237 = ScreenUtil().setWidth(237.0);
  static double wScreen238 = ScreenUtil().setWidth(238.0);
  static double wScreen239 = ScreenUtil().setWidth(239.0);
  static double wScreen240 = ScreenUtil().setWidth(240.0);

  static double wScreen241 = ScreenUtil().setWidth(241.0);
  static double wScreen242 = ScreenUtil().setWidth(242.0);
  static double wScreen243 = ScreenUtil().setWidth(243.0);
  static double wScreen244 = ScreenUtil().setWidth(244.0);
  static double wScreen245 = ScreenUtil().setWidth(245.0);
  static double wScreen246 = ScreenUtil().setWidth(246.0);
  static double wScreen247 = ScreenUtil().setWidth(247.0);
  static double wScreen248 = ScreenUtil().setWidth(248.0);
  static double wScreen249 = ScreenUtil().setWidth(249.0);
  static double wScreen250 = ScreenUtil().setWidth(250.0);
  static double wScreen251 = ScreenUtil().setWidth(251.0);
  static double wScreen252 = ScreenUtil().setWidth(252.0);
  static double wScreen253 = ScreenUtil().setWidth(253.0);
  static double wScreen254 = ScreenUtil().setWidth(254.0);
  static double wScreen255 = ScreenUtil().setWidth(255.0);
  static double wScreen256 = ScreenUtil().setWidth(256.0);
  static double wScreen257 = ScreenUtil().setWidth(257.0);
  static double wScreen258 = ScreenUtil().setWidth(258.0);
  static double wScreen259 = ScreenUtil().setWidth(259.0);
  static double wScreen260 = ScreenUtil().setWidth(260.0);

  static double wScreen261 = ScreenUtil().setWidth(261.0);
  static double wScreen262 = ScreenUtil().setWidth(262.0);
  static double wScreen263 = ScreenUtil().setWidth(263.0);
  static double wScreen264 = ScreenUtil().setWidth(264.0);
  static double wScreen265 = ScreenUtil().setWidth(265.0);
  static double wScreen266 = ScreenUtil().setWidth(266.0);
  static double wScreen267 = ScreenUtil().setWidth(267.0);
  static double wScreen268 = ScreenUtil().setWidth(268.0);
  static double wScreen269 = ScreenUtil().setWidth(269.0);
  static double wScreen270 = ScreenUtil().setWidth(270.0);
  static double wScreen271 = ScreenUtil().setWidth(271.0);
  static double wScreen272 = ScreenUtil().setWidth(272.0);
  static double wScreen273 = ScreenUtil().setWidth(273.0);
  static double wScreen274 = ScreenUtil().setWidth(274.0);
  static double wScreen275 = ScreenUtil().setWidth(275.0);
  static double wScreen276 = ScreenUtil().setWidth(276.0);
  static double wScreen277 = ScreenUtil().setWidth(277.0);
  static double wScreen278 = ScreenUtil().setWidth(278.0);
  static double wScreen279 = ScreenUtil().setWidth(279.0);
  static double wScreen280 = ScreenUtil().setWidth(280.0);

  static double wScreen281 = ScreenUtil().setWidth(281.0);
  static double wScreen282 = ScreenUtil().setWidth(282.0);
  static double wScreen283 = ScreenUtil().setWidth(283.0);
  static double wScreen284 = ScreenUtil().setWidth(284.0);
  static double wScreen285 = ScreenUtil().setWidth(285.0);
  static double wScreen286 = ScreenUtil().setWidth(286.0);
  static double wScreen287 = ScreenUtil().setWidth(287.0);
  static double wScreen288 = ScreenUtil().setWidth(288.0);
  static double wScreen289 = ScreenUtil().setWidth(289.0);
  static double wScreen290 = ScreenUtil().setWidth(290.0);
  static double wScreen291 = ScreenUtil().setWidth(291.0);
  static double wScreen292 = ScreenUtil().setWidth(292.0);
  static double wScreen293 = ScreenUtil().setWidth(293.0);
  static double wScreen294 = ScreenUtil().setWidth(294.0);
  static double wScreen295 = ScreenUtil().setWidth(295.0);
  static double wScreen296 = ScreenUtil().setWidth(296.0);
  static double wScreen297 = ScreenUtil().setWidth(297.0);
  static double wScreen298 = ScreenUtil().setWidth(298.0);
  static double wScreen299 = ScreenUtil().setWidth(299.0);
  static double wScreen300 = ScreenUtil().setWidth(300.0);

  static double wScreen301 = ScreenUtil().setWidth(301.0);
  static double wScreen302 = ScreenUtil().setWidth(302.0);
  static double wScreen303 = ScreenUtil().setWidth(303.0);
  static double wScreen304 = ScreenUtil().setWidth(304.0);
  static double wScreen305 = ScreenUtil().setWidth(305.0);
  static double wScreen306 = ScreenUtil().setWidth(306.0);
  static double wScreen307 = ScreenUtil().setWidth(307.0);
  static double wScreen308 = ScreenUtil().setWidth(308.0);
  static double wScreen309 = ScreenUtil().setWidth(309.0);
  static double wScreen310 = ScreenUtil().setWidth(310.0);
  static double wScreen311 = ScreenUtil().setWidth(311.0);
  static double wScreen312 = ScreenUtil().setWidth(312.0);
  static double wScreen313 = ScreenUtil().setWidth(313.0);
  static double wScreen314 = ScreenUtil().setWidth(314.0);
  static double wScreen315 = ScreenUtil().setWidth(315.0);
  static double wScreen316 = ScreenUtil().setWidth(316.0);
  static double wScreen317 = ScreenUtil().setWidth(317.0);
  static double wScreen318 = ScreenUtil().setWidth(318.0);
  static double wScreen319 = ScreenUtil().setWidth(319.0);
  static double wScreen320 = ScreenUtil().setWidth(320.0);

  static double wScreen331 = ScreenUtil().setWidth(331.0);
  static double wScreen332 = ScreenUtil().setWidth(332.0);
  static double wScreen333 = ScreenUtil().setWidth(333.0);
  static double wScreen334 = ScreenUtil().setWidth(334.0);
  static double wScreen335 = ScreenUtil().setWidth(335.0);
  static double wScreen336 = ScreenUtil().setWidth(336.0);
  static double wScreen337 = ScreenUtil().setWidth(337.0);
  static double wScreen338 = ScreenUtil().setWidth(338.0);
  static double wScreen339 = ScreenUtil().setWidth(339.0);
  static double wScreen340 = ScreenUtil().setWidth(340.0);
  static double wScreen341 = ScreenUtil().setWidth(341.0);
  static double wScreen342 = ScreenUtil().setWidth(342.0);
  static double wScreen343 = ScreenUtil().setWidth(343.0);
  static double wScreen344 = ScreenUtil().setWidth(344.0);
  static double wScreen345 = ScreenUtil().setWidth(345.0);
  static double wScreen346 = ScreenUtil().setWidth(346.0);
  static double wScreen347 = ScreenUtil().setWidth(347.0);
  static double wScreen348 = ScreenUtil().setWidth(348.0);
  static double wScreen349 = ScreenUtil().setWidth(349.0);
  static double wScreen350 = ScreenUtil().setWidth(350.0);

  static double wScreen351 = ScreenUtil().setWidth(351.0);
  static double wScreen352 = ScreenUtil().setWidth(352.0);
  static double wScreen353 = ScreenUtil().setWidth(353.0);
  static double wScreen354 = ScreenUtil().setWidth(354.0);
  static double wScreen355 = ScreenUtil().setWidth(355.0);
  static double wScreen356 = ScreenUtil().setWidth(356.0);
  static double wScreen357 = ScreenUtil().setWidth(357.0);
  static double wScreen358 = ScreenUtil().setWidth(358.0);
  static double wScreen359 = ScreenUtil().setWidth(359.0);
  static double wScreen360 = ScreenUtil().setWidth(360.0);
  static double wScreen361 = ScreenUtil().setWidth(361.0);
  static double wScreen362 = ScreenUtil().setWidth(362.0);
  static double wScreen363 = ScreenUtil().setWidth(363.0);
  static double wScreen364 = ScreenUtil().setWidth(364.0);
  static double wScreen365 = ScreenUtil().setWidth(365.0);
  static double wScreen366 = ScreenUtil().setWidth(366.0);
  static double wScreen367 = ScreenUtil().setWidth(367.0);
  static double wScreen368 = ScreenUtil().setWidth(368.0);
  static double wScreen369 = ScreenUtil().setWidth(369.0);
  static double wScreen370 = ScreenUtil().setWidth(370.0);

  static double wScreen371 = ScreenUtil().setWidth(371.0);
  static double wScreen372 = ScreenUtil().setWidth(372.0);
  static double wScreen373 = ScreenUtil().setWidth(373.0);
  static double wScreen374 = ScreenUtil().setWidth(374.0);
  static double wScreen375 = ScreenUtil().setWidth(375.0);

  /// 根据高度适配
  static double hScree1 = ScreenUtil().setHeight(1.0);
  static double hScree2 = ScreenUtil().setHeight(2.0);
  static double hScree3 = ScreenUtil().setHeight(3.0);
  static double hScree4 = ScreenUtil().setHeight(4.0);
  static double hScree5 = ScreenUtil().setHeight(5.0);
  static double hScree6 = ScreenUtil().setHeight(6.0);
  static double hScree7 = ScreenUtil().setHeight(7.0);
  static double hScree8 = ScreenUtil().setHeight(8.0);
  static double hScree9 = ScreenUtil().setHeight(9.0);
  static double hScree10 = ScreenUtil().setHeight(10.0);
  static double hScree11 = ScreenUtil().setHeight(11.0);
  static double hScree12 = ScreenUtil().setHeight(12.0);
  static double hScree13 = ScreenUtil().setHeight(13.0);
  static double hScree14 = ScreenUtil().setHeight(14.0);
  static double hScree15 = ScreenUtil().setHeight(15.0);
  static double hScree16 = ScreenUtil().setHeight(16.0);
  static double hScree17 = ScreenUtil().setHeight(17.0);
  static double hScree18 = ScreenUtil().setHeight(18.0);
  static double hScree19 = ScreenUtil().setHeight(19.0);
  static double hScree20 = ScreenUtil().setHeight(20.0);

  static double hScree21 = ScreenUtil().setHeight(21.0);
  static double hScree22 = ScreenUtil().setHeight(22.0);
  static double hScree23 = ScreenUtil().setHeight(23.0);
  static double hScree24 = ScreenUtil().setHeight(24.0);
  static double hScree25 = ScreenUtil().setHeight(25.0);
  static double hScree26 = ScreenUtil().setHeight(26.0);
  static double hScree27 = ScreenUtil().setHeight(27.0);
  static double hScree28 = ScreenUtil().setHeight(28.0);
  static double hScree29 = ScreenUtil().setHeight(29.0);
  static double hScree30 = ScreenUtil().setHeight(30.0);
  static double hScree31 = ScreenUtil().setHeight(31.0);
  static double hScree32 = ScreenUtil().setHeight(32.0);
  static double hScree33 = ScreenUtil().setHeight(33.0);
  static double hScree34 = ScreenUtil().setHeight(34.0);
  static double hScree35 = ScreenUtil().setHeight(35.0);
  static double hScree36 = ScreenUtil().setHeight(36.0);
  static double hScree37 = ScreenUtil().setHeight(37.0);
  static double hScree38 = ScreenUtil().setHeight(38.0);
  static double hScree39 = ScreenUtil().setHeight(39.0);
  static double hScree40 = ScreenUtil().setHeight(40.0);

  static double hScree41 = ScreenUtil().setHeight(41.0);
  static double hScree42 = ScreenUtil().setHeight(42.0);
  static double hScree43 = ScreenUtil().setHeight(43.0);
  static double hScree44 = ScreenUtil().setHeight(44.0);
  static double hScree45 = ScreenUtil().setHeight(45.0);
  static double hScree46 = ScreenUtil().setHeight(46.0);
  static double hScree47 = ScreenUtil().setHeight(47.0);
  static double hScree48 = ScreenUtil().setHeight(48.0);
  static double hScree49 = ScreenUtil().setHeight(49.0);
  static double hScree50 = ScreenUtil().setHeight(50.0);
  static double hScree51 = ScreenUtil().setHeight(51.0);
  static double hScree52 = ScreenUtil().setHeight(52.0);
  static double hScree53 = ScreenUtil().setHeight(53.0);
  static double hScree54 = ScreenUtil().setHeight(54.0);
  static double hScree55 = ScreenUtil().setHeight(55.0);
  static double hScree56 = ScreenUtil().setHeight(56.0);
  static double hScree57 = ScreenUtil().setHeight(57.0);
  static double hScree58 = ScreenUtil().setHeight(58.0);
  static double hScree59 = ScreenUtil().setHeight(59.0);
  static double hScree60 = ScreenUtil().setHeight(60.0);

  static double hScree61 = ScreenUtil().setHeight(61.0);
  static double hScree62 = ScreenUtil().setHeight(62.0);
  static double hScree63 = ScreenUtil().setHeight(63.0);
  static double hScree64 = ScreenUtil().setHeight(64.0);
  static double hScree65 = ScreenUtil().setHeight(65.0);
  static double hScree66 = ScreenUtil().setHeight(66.0);
  static double hScree67 = ScreenUtil().setHeight(67.0);
  static double hScree68 = ScreenUtil().setHeight(68.0);
  static double hScree69 = ScreenUtil().setHeight(69.0);
  static double hScree70 = ScreenUtil().setHeight(70.0);
  static double hScree71 = ScreenUtil().setHeight(71.0);
  static double hScree72 = ScreenUtil().setHeight(72.0);
  static double hScree73 = ScreenUtil().setHeight(73.0);
  static double hScree74 = ScreenUtil().setHeight(74.0);
  static double hScree75 = ScreenUtil().setHeight(75.0);
  static double hScree76 = ScreenUtil().setHeight(76.0);
  static double hScree77 = ScreenUtil().setHeight(77.0);
  static double hScree78 = ScreenUtil().setHeight(78.0);
  static double hScree79 = ScreenUtil().setHeight(79.0);
  static double hScree80 = ScreenUtil().setHeight(80.0);

  static double hScree81 = ScreenUtil().setHeight(81.0);
  static double hScree82 = ScreenUtil().setHeight(82.0);
  static double hScree83 = ScreenUtil().setHeight(83.0);
  static double hScree84 = ScreenUtil().setHeight(84.0);
  static double hScree85 = ScreenUtil().setHeight(85.0);
  static double hScree86 = ScreenUtil().setHeight(86.0);
  static double hScree87 = ScreenUtil().setHeight(87.0);
  static double hScree88 = ScreenUtil().setHeight(88.0);
  static double hScree89 = ScreenUtil().setHeight(89.0);
  static double hScree90 = ScreenUtil().setHeight(90.0);
  static double hScree91 = ScreenUtil().setHeight(91.0);
  static double hScree92 = ScreenUtil().setHeight(92.0);
  static double hScree93 = ScreenUtil().setHeight(93.0);
  static double hScree94 = ScreenUtil().setHeight(94.0);
  static double hScree95 = ScreenUtil().setHeight(95.0);
  static double hScree96 = ScreenUtil().setHeight(96.0);
  static double hScree97 = ScreenUtil().setHeight(97.0);
  static double hScree98 = ScreenUtil().setHeight(98.0);
  static double hScree99 = ScreenUtil().setHeight(99.0);
  static double hScree100 = ScreenUtil().setHeight(100.0);

  static double hScree101 = ScreenUtil().setHeight(101.0);
  static double hScree102 = ScreenUtil().setHeight(102.0);
  static double hScree103 = ScreenUtil().setHeight(103.0);
  static double hScree104 = ScreenUtil().setHeight(104.0);
  static double hScree105 = ScreenUtil().setHeight(105.0);
  static double hScree106 = ScreenUtil().setHeight(106.0);
  static double hScree107 = ScreenUtil().setHeight(107.0);
  static double hScree108 = ScreenUtil().setHeight(108.0);
  static double hScree109 = ScreenUtil().setHeight(109.0);
  static double hScree110 = ScreenUtil().setHeight(110.0);
  static double hScree111 = ScreenUtil().setHeight(111.0);
  static double hScree112 = ScreenUtil().setHeight(112.0);
  static double hScree113 = ScreenUtil().setHeight(113.0);
  static double hScree114 = ScreenUtil().setHeight(114.0);
  static double hScree115 = ScreenUtil().setHeight(115.0);
  static double hScree116 = ScreenUtil().setHeight(116.0);
  static double hScree117 = ScreenUtil().setHeight(117.0);
  static double hScree118 = ScreenUtil().setHeight(118.0);
  static double hScree119 = ScreenUtil().setHeight(119.0);
  static double hScree120 = ScreenUtil().setHeight(120.0);

  static double hScree121 = ScreenUtil().setHeight(121.0);
  static double hScree122 = ScreenUtil().setHeight(122.0);
  static double hScree123 = ScreenUtil().setHeight(123.0);
  static double hScree124 = ScreenUtil().setHeight(124.0);
  static double hScree125 = ScreenUtil().setHeight(125.0);
  static double hScree126 = ScreenUtil().setHeight(126.0);
  static double hScree127 = ScreenUtil().setHeight(127.0);
  static double hScree128 = ScreenUtil().setHeight(128.0);
  static double hScree129 = ScreenUtil().setHeight(129.0);
  static double hScree130 = ScreenUtil().setHeight(130.0);
  static double hScree131 = ScreenUtil().setHeight(131.0);
  static double hScree132 = ScreenUtil().setHeight(132.0);
  static double hScree133 = ScreenUtil().setHeight(133.0);
  static double hScree134 = ScreenUtil().setHeight(134.0);
  static double hScree135 = ScreenUtil().setHeight(135.0);
  static double hScree136 = ScreenUtil().setHeight(136.0);
  static double hScree137 = ScreenUtil().setHeight(137.0);
  static double hScree138 = ScreenUtil().setHeight(138.0);
  static double hScree139 = ScreenUtil().setHeight(139.0);
  static double hScree140 = ScreenUtil().setHeight(140.0);

  static double hScree151 = ScreenUtil().setHeight(151.0);
  static double hScree152 = ScreenUtil().setHeight(152.0);
  static double hScree153 = ScreenUtil().setHeight(153.0);
  static double hScree154 = ScreenUtil().setHeight(154.0);
  static double hScree155 = ScreenUtil().setHeight(155.0);
  static double hScree156 = ScreenUtil().setHeight(156.0);
  static double hScree157 = ScreenUtil().setHeight(157.0);
  static double hScree158 = ScreenUtil().setHeight(158.0);
  static double hScree159 = ScreenUtil().setHeight(159.0);
  static double hScree160 = ScreenUtil().setHeight(160.0);
  static double hScree161 = ScreenUtil().setHeight(161.0);
  static double hScree162 = ScreenUtil().setHeight(162.0);
  static double hScree163 = ScreenUtil().setHeight(163.0);
  static double hScree164 = ScreenUtil().setHeight(164.0);
  static double hScree165 = ScreenUtil().setHeight(165.0);
  static double hScree166 = ScreenUtil().setHeight(166.0);
  static double hScree167 = ScreenUtil().setHeight(167.0);
  static double hScree168 = ScreenUtil().setHeight(168.0);
  static double hScree169 = ScreenUtil().setHeight(169.0);
  static double hScree170 = ScreenUtil().setHeight(170.0);

  static double hScree181 = ScreenUtil().setHeight(181.0);
  static double hScree182 = ScreenUtil().setHeight(182.0);
  static double hScree183 = ScreenUtil().setHeight(183.0);
  static double hScree184 = ScreenUtil().setHeight(184.0);
  static double hScree185 = ScreenUtil().setHeight(185.0);
  static double hScree186 = ScreenUtil().setHeight(186.0);
  static double hScree187 = ScreenUtil().setHeight(187.0);
  static double hScree188 = ScreenUtil().setHeight(188.0);
  static double hScree189 = ScreenUtil().setHeight(189.0);
  static double hScree190 = ScreenUtil().setHeight(190.0);
  static double hScree191 = ScreenUtil().setHeight(191.0);
  static double hScree192 = ScreenUtil().setHeight(192.0);
  static double hScree193 = ScreenUtil().setHeight(193.0);
  static double hScree194 = ScreenUtil().setHeight(194.0);
  static double hScree195 = ScreenUtil().setHeight(195.0);
  static double hScree196 = ScreenUtil().setHeight(196.0);
  static double hScree197 = ScreenUtil().setHeight(197.0);
  static double hScree198 = ScreenUtil().setHeight(198.0);
  static double hScree199 = ScreenUtil().setHeight(199.0);
  static double hScree200 = ScreenUtil().setHeight(200.0);

  static double hScree201 = ScreenUtil().setHeight(201.0);
  static double hScree202 = ScreenUtil().setHeight(202.0);
  static double hScree203 = ScreenUtil().setHeight(203.0);
  static double hScree204 = ScreenUtil().setHeight(204.0);
  static double hScree205 = ScreenUtil().setHeight(205.0);
  static double hScree206 = ScreenUtil().setHeight(206.0);
  static double hScree207 = ScreenUtil().setHeight(207.0);
  static double hScree208 = ScreenUtil().setHeight(208.0);
  static double hScree209 = ScreenUtil().setHeight(209.0);
  static double hScree210 = ScreenUtil().setHeight(210.0);
  static double hScree211 = ScreenUtil().setHeight(211.0);
  static double hScree212 = ScreenUtil().setHeight(212.0);
  static double hScree213 = ScreenUtil().setHeight(213.0);
  static double hScree214 = ScreenUtil().setHeight(214.0);
  static double hScree215 = ScreenUtil().setHeight(215.0);
  static double hScree216 = ScreenUtil().setHeight(216.0);
  static double hScree217 = ScreenUtil().setHeight(217.0);
  static double hScree218 = ScreenUtil().setHeight(218.0);
  static double hScree219 = ScreenUtil().setHeight(219.0);
  static double hScree220 = ScreenUtil().setHeight(220.0);

  static double hScree221 = ScreenUtil().setHeight(221.0);
  static double hScree222 = ScreenUtil().setHeight(222.0);
  static double hScree223 = ScreenUtil().setHeight(223.0);
  static double hScree224 = ScreenUtil().setHeight(224.0);
  static double hScree225 = ScreenUtil().setHeight(225.0);
  static double hScree226 = ScreenUtil().setHeight(226.0);
  static double hScree227 = ScreenUtil().setHeight(227.0);
  static double hScree228 = ScreenUtil().setHeight(228.0);
  static double hScree229 = ScreenUtil().setHeight(229.0);
  static double hScree230 = ScreenUtil().setHeight(230.0);
  static double hScree231 = ScreenUtil().setHeight(231.0);
  static double hScree232 = ScreenUtil().setHeight(232.0);
  static double hScree233 = ScreenUtil().setHeight(233.0);
  static double hScree234 = ScreenUtil().setHeight(234.0);
  static double hScree235 = ScreenUtil().setHeight(235.0);
  static double hScree236 = ScreenUtil().setHeight(236.0);
  static double hScree237 = ScreenUtil().setHeight(237.0);
  static double hScree238 = ScreenUtil().setHeight(238.0);
  static double hScree239 = ScreenUtil().setHeight(239.0);
  static double hScree240 = ScreenUtil().setHeight(240.0);

  static double hScree241 = ScreenUtil().setHeight(241.0);
  static double hScree242 = ScreenUtil().setHeight(242.0);
  static double hScree243 = ScreenUtil().setHeight(243.0);
  static double hScree244 = ScreenUtil().setHeight(244.0);
  static double hScree245 = ScreenUtil().setHeight(245.0);
  static double hScree246 = ScreenUtil().setHeight(246.0);
  static double hScree247 = ScreenUtil().setHeight(247.0);
  static double hScree248 = ScreenUtil().setHeight(248.0);
  static double hScree249 = ScreenUtil().setHeight(249.0);
  static double hScree250 = ScreenUtil().setHeight(250.0);
  static double hScree251 = ScreenUtil().setHeight(251.0);
  static double hScree252 = ScreenUtil().setHeight(252.0);
  static double hScree253 = ScreenUtil().setHeight(253.0);
  static double hScree254 = ScreenUtil().setHeight(254.0);
  static double hScree255 = ScreenUtil().setHeight(255.0);
  static double hScree256 = ScreenUtil().setHeight(256.0);
  static double hScree257 = ScreenUtil().setHeight(257.0);
  static double hScree258 = ScreenUtil().setHeight(258.0);
  static double hScree259 = ScreenUtil().setHeight(259.0);
  static double hScree260 = ScreenUtil().setHeight(260.0);

  static double hScree261 = ScreenUtil().setHeight(261.0);
  static double hScree262 = ScreenUtil().setHeight(262.0);
  static double hScree263 = ScreenUtil().setHeight(263.0);
  static double hScree264 = ScreenUtil().setHeight(264.0);
  static double hScree265 = ScreenUtil().setHeight(265.0);
  static double hScree266 = ScreenUtil().setHeight(266.0);
  static double hScree267 = ScreenUtil().setHeight(267.0);
  static double hScree268 = ScreenUtil().setHeight(268.0);
  static double hScree269 = ScreenUtil().setHeight(269.0);
  static double hScree270 = ScreenUtil().setHeight(270.0);
  static double hScree271 = ScreenUtil().setHeight(271.0);
  static double hScree272 = ScreenUtil().setHeight(272.0);
  static double hScree273 = ScreenUtil().setHeight(273.0);
  static double hScree274 = ScreenUtil().setHeight(274.0);
  static double hScree275 = ScreenUtil().setHeight(275.0);
  static double hScree276 = ScreenUtil().setHeight(276.0);
  static double hScree277 = ScreenUtil().setHeight(277.0);
  static double hScree278 = ScreenUtil().setHeight(278.0);
  static double hScree279 = ScreenUtil().setHeight(279.0);
  static double hScree280 = ScreenUtil().setHeight(280.0);

  static double hScree281 = ScreenUtil().setHeight(281.0);
  static double hScree282 = ScreenUtil().setHeight(282.0);
  static double hScree283 = ScreenUtil().setHeight(283.0);
  static double hScree284 = ScreenUtil().setHeight(284.0);
  static double hScree285 = ScreenUtil().setHeight(285.0);
  static double hScree286 = ScreenUtil().setHeight(286.0);
  static double hScree287 = ScreenUtil().setHeight(287.0);
  static double hScree288 = ScreenUtil().setHeight(288.0);
  static double hScree289 = ScreenUtil().setHeight(289.0);
  static double hScree290 = ScreenUtil().setHeight(290.0);
  static double hScree291 = ScreenUtil().setHeight(291.0);
  static double hScree292 = ScreenUtil().setHeight(292.0);
  static double hScree293 = ScreenUtil().setHeight(293.0);
  static double hScree294 = ScreenUtil().setHeight(294.0);
  static double hScree295 = ScreenUtil().setHeight(295.0);
  static double hScree296 = ScreenUtil().setHeight(296.0);
  static double hScree297 = ScreenUtil().setHeight(297.0);
  static double hScree298 = ScreenUtil().setHeight(298.0);
  static double hScree299 = ScreenUtil().setHeight(299.0);
  static double hScree300 = ScreenUtil().setHeight(300.0);

  static double hScree301 = ScreenUtil().setHeight(301.0);
  static double hScree302 = ScreenUtil().setHeight(302.0);
  static double hScree303 = ScreenUtil().setHeight(303.0);
  static double hScree304 = ScreenUtil().setHeight(304.0);
  static double hScree305 = ScreenUtil().setHeight(305.0);
  static double hScree306 = ScreenUtil().setHeight(306.0);
  static double hScree307 = ScreenUtil().setHeight(307.0);
  static double hScree308 = ScreenUtil().setHeight(308.0);
  static double hScree309 = ScreenUtil().setHeight(309.0);
  static double hScree310 = ScreenUtil().setHeight(310.0);
  static double hScree311 = ScreenUtil().setHeight(311.0);
  static double hScree312 = ScreenUtil().setHeight(312.0);
  static double hScree313 = ScreenUtil().setHeight(313.0);
  static double hScree314 = ScreenUtil().setHeight(314.0);
  static double hScree315 = ScreenUtil().setHeight(315.0);
  static double hScree316 = ScreenUtil().setHeight(316.0);
  static double hScree317 = ScreenUtil().setHeight(317.0);
  static double hScree318 = ScreenUtil().setHeight(318.0);
  static double hScree319 = ScreenUtil().setHeight(319.0);
  static double hScree320 = ScreenUtil().setHeight(320.0);

  static double hScree331 = ScreenUtil().setHeight(331.0);
  static double hScree332 = ScreenUtil().setHeight(332.0);
  static double hScree333 = ScreenUtil().setHeight(333.0);
  static double hScree334 = ScreenUtil().setHeight(334.0);
  static double hScree335 = ScreenUtil().setHeight(335.0);
  static double hScree336 = ScreenUtil().setHeight(336.0);
  static double hScree337 = ScreenUtil().setHeight(337.0);
  static double hScree338 = ScreenUtil().setHeight(338.0);
  static double hScree339 = ScreenUtil().setHeight(339.0);
  static double hScree340 = ScreenUtil().setHeight(340.0);
  static double hScree341 = ScreenUtil().setHeight(341.0);
  static double hScree342 = ScreenUtil().setHeight(342.0);
  static double hScree343 = ScreenUtil().setHeight(343.0);
  static double hScree344 = ScreenUtil().setHeight(344.0);
  static double hScree345 = ScreenUtil().setHeight(345.0);
  static double hScree346 = ScreenUtil().setHeight(346.0);
  static double hScree347 = ScreenUtil().setHeight(347.0);
  static double hScree348 = ScreenUtil().setHeight(348.0);
  static double hScree349 = ScreenUtil().setHeight(349.0);
  static double hScree350 = ScreenUtil().setHeight(350.0);

  static double hScree351 = ScreenUtil().setHeight(351.0);
  static double hScree352 = ScreenUtil().setHeight(352.0);
  static double hScree353 = ScreenUtil().setHeight(353.0);
  static double hScree354 = ScreenUtil().setHeight(354.0);
  static double hScree355 = ScreenUtil().setHeight(355.0);
  static double hScree356 = ScreenUtil().setHeight(356.0);
  static double hScree357 = ScreenUtil().setHeight(357.0);
  static double hScree358 = ScreenUtil().setHeight(358.0);
  static double hScree359 = ScreenUtil().setHeight(359.0);
  static double hScree360 = ScreenUtil().setHeight(360.0);
  static double hScree361 = ScreenUtil().setHeight(361.0);
  static double hScree362 = ScreenUtil().setHeight(362.0);
  static double hScree363 = ScreenUtil().setHeight(363.0);
  static double hScree364 = ScreenUtil().setHeight(364.0);
  static double hScree365 = ScreenUtil().setHeight(365.0);
  static double hScree366 = ScreenUtil().setHeight(366.0);
  static double hScree367 = ScreenUtil().setHeight(367.0);
  static double hScree368 = ScreenUtil().setHeight(368.0);
  static double hScree369 = ScreenUtil().setHeight(369.0);
  static double hScree370 = ScreenUtil().setHeight(370.0);

  static double hScree371 = ScreenUtil().setHeight(371.0);
  static double hScree372 = ScreenUtil().setHeight(372.0);
  static double hScree373 = ScreenUtil().setHeight(373.0);
  static double hScree374 = ScreenUtil().setHeight(374.0);
  static double hScree375 = ScreenUtil().setHeight(375.0);
  static double hScree376 = ScreenUtil().setHeight(376.0);
  static double hScree377 = ScreenUtil().setHeight(377.0);
  static double hScree378 = ScreenUtil().setHeight(378.0);
  static double hScree379 = ScreenUtil().setHeight(379.0);
  static double hScree380 = ScreenUtil().setHeight(380.0);
  static double hScree381 = ScreenUtil().setHeight(381.0);
  static double hScree382 = ScreenUtil().setHeight(382.0);
  static double hScree383 = ScreenUtil().setHeight(383.0);
  static double hScree384 = ScreenUtil().setHeight(384.0);
  static double hScree385 = ScreenUtil().setHeight(385.0);
  static double hScree386 = ScreenUtil().setHeight(386.0);
  static double hScree387 = ScreenUtil().setHeight(387.0);
  static double hScree388 = ScreenUtil().setHeight(388.0);
  static double hScree389 = ScreenUtil().setHeight(389.0);
  static double hScree390 = ScreenUtil().setHeight(390.0);

  static double hScree391 = ScreenUtil().setHeight(391.0);
  static double hScree392 = ScreenUtil().setHeight(392.0);
  static double hScree393 = ScreenUtil().setHeight(393.0);
  static double hScree394 = ScreenUtil().setHeight(394.0);
  static double hScree395 = ScreenUtil().setHeight(395.0);
  static double hScree396 = ScreenUtil().setHeight(396.0);
  static double hScree397 = ScreenUtil().setHeight(397.0);
  static double hScree398 = ScreenUtil().setHeight(398.0);
  static double hScree399 = ScreenUtil().setHeight(399.0);
  static double hScree400 = ScreenUtil().setHeight(400.0);
  static double hScree401 = ScreenUtil().setHeight(401.0);
  static double hScree402 = ScreenUtil().setHeight(402.0);
  static double hScree403 = ScreenUtil().setHeight(403.0);
  static double hScree404 = ScreenUtil().setHeight(404.0);
  static double hScree405 = ScreenUtil().setHeight(405.0);
  static double hScree406 = ScreenUtil().setHeight(406.0);
  static double hScree407 = ScreenUtil().setHeight(407.0);
  static double hScree408 = ScreenUtil().setHeight(408.0);
  static double hScree409 = ScreenUtil().setHeight(409.0);
  static double hScree410 = ScreenUtil().setHeight(410.0);

  static double hScree411 = ScreenUtil().setHeight(411.0);
  static double hScree412 = ScreenUtil().setHeight(412.0);
  static double hScree413 = ScreenUtil().setHeight(413.0);
  static double hScree414 = ScreenUtil().setHeight(414.0);
  static double hScree415 = ScreenUtil().setHeight(415.0);
  static double hScree416 = ScreenUtil().setHeight(416.0);
  static double hScree417 = ScreenUtil().setHeight(417.0);
  static double hScree418 = ScreenUtil().setHeight(418.0);
  static double hScree419 = ScreenUtil().setHeight(419.0);
  static double hScree420 = ScreenUtil().setHeight(420.0);
  static double hScree421 = ScreenUtil().setHeight(421.0);
  static double hScree422 = ScreenUtil().setHeight(422.0);
  static double hScree423 = ScreenUtil().setHeight(423.0);
  static double hScree424 = ScreenUtil().setHeight(424.0);
  static double hScree425 = ScreenUtil().setHeight(425.0);
  static double hScree426 = ScreenUtil().setHeight(426.0);
  static double hScree427 = ScreenUtil().setHeight(427.0);
  static double hScree428 = ScreenUtil().setHeight(428.0);
  static double hScree429 = ScreenUtil().setHeight(429.0);
  static double hScree430 = ScreenUtil().setHeight(430.0);

  static double hScree431 = ScreenUtil().setHeight(431.0);
  static double hScree432 = ScreenUtil().setHeight(432.0);
  static double hScree433 = ScreenUtil().setHeight(433.0);
  static double hScree434 = ScreenUtil().setHeight(434.0);
  static double hScree435 = ScreenUtil().setHeight(435.0);
  static double hScree436 = ScreenUtil().setHeight(436.0);
  static double hScree437 = ScreenUtil().setHeight(437.0);
  static double hScree438 = ScreenUtil().setHeight(438.0);
  static double hScree439 = ScreenUtil().setHeight(439.0);
  static double hScree440 = ScreenUtil().setHeight(440.0);
  static double hScree441 = ScreenUtil().setHeight(441.0);
  static double hScree442 = ScreenUtil().setHeight(442.0);
  static double hScree443 = ScreenUtil().setHeight(443.0);
  static double hScree444 = ScreenUtil().setHeight(444.0);
  static double hScree445 = ScreenUtil().setHeight(445.0);
  static double hScree446 = ScreenUtil().setHeight(446.0);
  static double hScree447 = ScreenUtil().setHeight(447.0);
  static double hScree448 = ScreenUtil().setHeight(448.0);
  static double hScree449 = ScreenUtil().setHeight(449.0);
  static double hScree450 = ScreenUtil().setHeight(450.0);

  static double hScree451 = ScreenUtil().setHeight(451.0);
  static double hScree452 = ScreenUtil().setHeight(452.0);
  static double hScree453 = ScreenUtil().setHeight(453.0);
  static double hScree454 = ScreenUtil().setHeight(454.0);
  static double hScree455 = ScreenUtil().setHeight(455.0);
  static double hScree456 = ScreenUtil().setHeight(456.0);
  static double hScree457 = ScreenUtil().setHeight(457.0);
  static double hScree458 = ScreenUtil().setHeight(458.0);
  static double hScree459 = ScreenUtil().setHeight(459.0);
  static double hScree460 = ScreenUtil().setHeight(460.0);
  static double hScree461 = ScreenUtil().setHeight(461.0);
  static double hScree462 = ScreenUtil().setHeight(462.0);
  static double hScree463 = ScreenUtil().setHeight(463.0);
  static double hScree464 = ScreenUtil().setHeight(464.0);
  static double hScree465 = ScreenUtil().setHeight(465.0);
  static double hScree466 = ScreenUtil().setHeight(466.0);
  static double hScree467 = ScreenUtil().setHeight(467.0);
  static double hScree468 = ScreenUtil().setHeight(468.0);
  static double hScree469 = ScreenUtil().setHeight(469.0);
  static double hScree470 = ScreenUtil().setHeight(470.0);

  static double hScree471 = ScreenUtil().setHeight(471.0);
  static double hScree472 = ScreenUtil().setHeight(472.0);
  static double hScree473 = ScreenUtil().setHeight(473.0);
  static double hScree474 = ScreenUtil().setHeight(474.0);
  static double hScree475 = ScreenUtil().setHeight(475.0);
  static double hScree476 = ScreenUtil().setHeight(476.0);
  static double hScree477 = ScreenUtil().setHeight(477.0);
  static double hScree478 = ScreenUtil().setHeight(478.0);
  static double hScree479 = ScreenUtil().setHeight(479.0);
  static double hScree480 = ScreenUtil().setHeight(480.0);
  static double hScree481 = ScreenUtil().setHeight(481.0);
  static double hScree482 = ScreenUtil().setHeight(482.0);
  static double hScree483 = ScreenUtil().setHeight(483.0);
  static double hScree484 = ScreenUtil().setHeight(484.0);
  static double hScree485 = ScreenUtil().setHeight(485.0);
  static double hScree486 = ScreenUtil().setHeight(486.0);
  static double hScree487 = ScreenUtil().setHeight(487.0);
  static double hScree488 = ScreenUtil().setHeight(488.0);
  static double hScree489 = ScreenUtil().setHeight(489.0);
  static double hScree490 = ScreenUtil().setHeight(490.0);

  static double hScree491 = ScreenUtil().setHeight(491.0);
  static double hScree492 = ScreenUtil().setHeight(492.0);
  static double hScree493 = ScreenUtil().setHeight(493.0);
  static double hScree494 = ScreenUtil().setHeight(494.0);
  static double hScree495 = ScreenUtil().setHeight(495.0);
  static double hScree496 = ScreenUtil().setHeight(496.0);
  static double hScree497 = ScreenUtil().setHeight(497.0);
  static double hScree498 = ScreenUtil().setHeight(498.0);
  static double hScree499 = ScreenUtil().setHeight(499.0);
  static double hScree500 = ScreenUtil().setHeight(500.0);
  static double hScree501 = ScreenUtil().setHeight(501.0);
  static double hScree502 = ScreenUtil().setHeight(502.0);
  static double hScree503 = ScreenUtil().setHeight(503.0);
  static double hScree504 = ScreenUtil().setHeight(504.0);
  static double hScree505 = ScreenUtil().setHeight(505.0);
  static double hScree506 = ScreenUtil().setHeight(506.0);
  static double hScree507 = ScreenUtil().setHeight(507.0);
  static double hScree508 = ScreenUtil().setHeight(508.0);
  static double hScree509 = ScreenUtil().setHeight(509.0);
  static double hScree510 = ScreenUtil().setHeight(510.0);

  static double hScree511 = ScreenUtil().setHeight(511.0);
  static double hScree512 = ScreenUtil().setHeight(512.0);
  static double hScree513 = ScreenUtil().setHeight(513.0);
  static double hScree514 = ScreenUtil().setHeight(514.0);
  static double hScree515 = ScreenUtil().setHeight(515.0);
  static double hScree516 = ScreenUtil().setHeight(516.0);
  static double hScree517 = ScreenUtil().setHeight(517.0);
  static double hScree518 = ScreenUtil().setHeight(518.0);
  static double hScree519 = ScreenUtil().setHeight(519.0);
  static double hScree520 = ScreenUtil().setHeight(520.0);
  static double hScree521 = ScreenUtil().setHeight(521.0);
  static double hScree522 = ScreenUtil().setHeight(522.0);
  static double hScree523 = ScreenUtil().setHeight(523.0);
  static double hScree524 = ScreenUtil().setHeight(524.0);
  static double hScree525 = ScreenUtil().setHeight(525.0);
  static double hScree526 = ScreenUtil().setHeight(526.0);
  static double hScree527 = ScreenUtil().setHeight(527.0);
  static double hScree528 = ScreenUtil().setHeight(528.0);
  static double hScree529 = ScreenUtil().setHeight(529.0);
  static double hScree530 = ScreenUtil().setHeight(530.0);

  static double hScree531 = ScreenUtil().setHeight(531.0);
  static double hScree532 = ScreenUtil().setHeight(532.0);
  static double hScree533 = ScreenUtil().setHeight(533.0);
  static double hScree534 = ScreenUtil().setHeight(534.0);
  static double hScree535 = ScreenUtil().setHeight(535.0);
  static double hScree536 = ScreenUtil().setHeight(536.0);
  static double hScree537 = ScreenUtil().setHeight(537.0);
  static double hScree538 = ScreenUtil().setHeight(538.0);
  static double hScree539 = ScreenUtil().setHeight(539.0);
  static double hScree540 = ScreenUtil().setHeight(540.0);
  static double hScree541 = ScreenUtil().setHeight(541.0);
  static double hScree542 = ScreenUtil().setHeight(542.0);
  static double hScree543 = ScreenUtil().setHeight(543.0);
  static double hScree544 = ScreenUtil().setHeight(544.0);
  static double hScree545 = ScreenUtil().setHeight(545.0);
  static double hScree546 = ScreenUtil().setHeight(546.0);
  static double hScree547 = ScreenUtil().setHeight(547.0);
  static double hScree548 = ScreenUtil().setHeight(548.0);
  static double hScree549 = ScreenUtil().setHeight(549.0);
  static double hScree550 = ScreenUtil().setHeight(550.0);

  static double hScree551 = ScreenUtil().setHeight(551.0);
  static double hScree552 = ScreenUtil().setHeight(552.0);
  static double hScree553 = ScreenUtil().setHeight(553.0);
  static double hScree554 = ScreenUtil().setHeight(554.0);
  static double hScree555 = ScreenUtil().setHeight(555.0);
  static double hScree556 = ScreenUtil().setHeight(556.0);
  static double hScree557 = ScreenUtil().setHeight(557.0);
  static double hScree558 = ScreenUtil().setHeight(558.0);
  static double hScree559 = ScreenUtil().setHeight(559.0);
  static double hScree560 = ScreenUtil().setHeight(560.0);
  static double hScree561 = ScreenUtil().setHeight(561.0);
  static double hScree562 = ScreenUtil().setHeight(562.0);
  static double hScree563 = ScreenUtil().setHeight(563.0);
  static double hScree564 = ScreenUtil().setHeight(564.0);
  static double hScree565 = ScreenUtil().setHeight(565.0);
  static double hScree566 = ScreenUtil().setHeight(566.0);
  static double hScree567 = ScreenUtil().setHeight(567.0);
  static double hScree568 = ScreenUtil().setHeight(568.0);
  static double hScree569 = ScreenUtil().setHeight(569.0);
  static double hScree570 = ScreenUtil().setHeight(570.0);

  static double hScree571 = ScreenUtil().setHeight(571.0);
  static double hScree572 = ScreenUtil().setHeight(572.0);
  static double hScree573 = ScreenUtil().setHeight(573.0);
  static double hScree574 = ScreenUtil().setHeight(574.0);
  static double hScree575 = ScreenUtil().setHeight(575.0);
  static double hScree576 = ScreenUtil().setHeight(576.0);
  static double hScree577 = ScreenUtil().setHeight(577.0);
  static double hScree578 = ScreenUtil().setHeight(578.0);
  static double hScree579 = ScreenUtil().setHeight(579.0);
  static double hScree580 = ScreenUtil().setHeight(580.0);
  static double hScree581 = ScreenUtil().setHeight(581.0);
  static double hScree582 = ScreenUtil().setHeight(582.0);
  static double hScree583 = ScreenUtil().setHeight(583.0);
  static double hScree584 = ScreenUtil().setHeight(584.0);
  static double hScree585 = ScreenUtil().setHeight(585.0);
  static double hScree586 = ScreenUtil().setHeight(586.0);
  static double hScree587 = ScreenUtil().setHeight(587.0);
  static double hScree588 = ScreenUtil().setHeight(588.0);
  static double hScree589 = ScreenUtil().setHeight(589.0);
  static double hScree590 = ScreenUtil().setHeight(590.0);

  static double hScree591 = ScreenUtil().setHeight(591.0);
  static double hScree592 = ScreenUtil().setHeight(592.0);
  static double hScree593 = ScreenUtil().setHeight(593.0);
  static double hScree594 = ScreenUtil().setHeight(594.0);
  static double hScree595 = ScreenUtil().setHeight(595.0);
  static double hScree596 = ScreenUtil().setHeight(596.0);
  static double hScree597 = ScreenUtil().setHeight(597.0);
  static double hScree598 = ScreenUtil().setHeight(598.0);
  static double hScree599 = ScreenUtil().setHeight(599.0);
  static double hScree600 = ScreenUtil().setHeight(600.0);
  static double hScree601 = ScreenUtil().setHeight(601.0);
  static double hScree602 = ScreenUtil().setHeight(602.0);
  static double hScree603 = ScreenUtil().setHeight(603.0);
  static double hScree604 = ScreenUtil().setHeight(604.0);
  static double hScree605 = ScreenUtil().setHeight(605.0);
  static double hScree606 = ScreenUtil().setHeight(606.0);
  static double hScree607 = ScreenUtil().setHeight(607.0);
  static double hScree608 = ScreenUtil().setHeight(608.0);
  static double hScree609 = ScreenUtil().setHeight(609.0);
  static double hScree610 = ScreenUtil().setHeight(610.0);

  static double hScree611 = ScreenUtil().setHeight(611.0);
  static double hScree612 = ScreenUtil().setHeight(612.0);
  static double hScree613 = ScreenUtil().setHeight(613.0);
  static double hScree614 = ScreenUtil().setHeight(614.0);
  static double hScree615 = ScreenUtil().setHeight(615.0);
  static double hScree616 = ScreenUtil().setHeight(616.0);
  static double hScree617 = ScreenUtil().setHeight(617.0);
  static double hScree618 = ScreenUtil().setHeight(618.0);
  static double hScree619 = ScreenUtil().setHeight(619.0);
  static double hScree620 = ScreenUtil().setHeight(620.0);
  static double hScree621 = ScreenUtil().setHeight(621.0);
  static double hScree622 = ScreenUtil().setHeight(622.0);
  static double hScree623 = ScreenUtil().setHeight(623.0);
  static double hScree624 = ScreenUtil().setHeight(624.0);
  static double hScree625 = ScreenUtil().setHeight(625.0);
  static double hScree626 = ScreenUtil().setHeight(626.0);
  static double hScree627 = ScreenUtil().setHeight(627.0);
  static double hScree628 = ScreenUtil().setHeight(628.0);
  static double hScree629 = ScreenUtil().setHeight(629.0);
  static double hScree630 = ScreenUtil().setHeight(630.0);

  static double hScree631 = ScreenUtil().setHeight(631.0);
  static double hScree632 = ScreenUtil().setHeight(632.0);
  static double hScree633 = ScreenUtil().setHeight(633.0);
  static double hScree634 = ScreenUtil().setHeight(634.0);
  static double hScree635 = ScreenUtil().setHeight(635.0);
  static double hScree636 = ScreenUtil().setHeight(636.0);
  static double hScree637 = ScreenUtil().setHeight(637.0);
  static double hScree638 = ScreenUtil().setHeight(638.0);
  static double hScree639 = ScreenUtil().setHeight(639.0);
  static double hScree640 = ScreenUtil().setHeight(640.0);
  static double hScree641 = ScreenUtil().setHeight(641.0);
  static double hScree642 = ScreenUtil().setHeight(642.0);
  static double hScree643 = ScreenUtil().setHeight(643.0);
  static double hScree644 = ScreenUtil().setHeight(644.0);
  static double hScree645 = ScreenUtil().setHeight(645.0);
  static double hScree646 = ScreenUtil().setHeight(646.0);
  static double hScree647 = ScreenUtil().setHeight(647.0);
  static double hScree648 = ScreenUtil().setHeight(648.0);
  static double hScree649 = ScreenUtil().setHeight(649.0);
  static double hScree650 = ScreenUtil().setHeight(650.0);

  static double hScree651 = ScreenUtil().setHeight(651.0);
  static double hScree652 = ScreenUtil().setHeight(652.0);
  static double hScree653 = ScreenUtil().setHeight(653.0);
  static double hScree654 = ScreenUtil().setHeight(654.0);
  static double hScree655 = ScreenUtil().setHeight(655.0);
  static double hScree656 = ScreenUtil().setHeight(656.0);
  static double hScree657 = ScreenUtil().setHeight(657.0);
  static double hScree658 = ScreenUtil().setHeight(658.0);
  static double hScree659 = ScreenUtil().setHeight(659.0);
  static double hScree660 = ScreenUtil().setHeight(660.0);
  static double hScree661 = ScreenUtil().setHeight(661.0);
  static double hScree662 = ScreenUtil().setHeight(662.0);
  static double hScree663 = ScreenUtil().setHeight(663.0);
  static double hScree664 = ScreenUtil().setHeight(664.0);
  static double hScree665 = ScreenUtil().setHeight(665.0);
  static double hScree666 = ScreenUtil().setHeight(666.0);
  static double hScree667 = ScreenUtil().setHeight(667.0);

  /// 适配文字大小
  static double spScreen8 = ScreenUtil().setSp(8.0);
  static double spScreen9 = ScreenUtil().setSp(9.0);
  static double spScreen10 = ScreenUtil().setSp(10.0);
  static double spScreen11 = ScreenUtil().setSp(11.0);
  static double spScreen12 = ScreenUtil().setSp(12.0);
  static double spScreen13 = ScreenUtil().setSp(13.0);
  static double spScreen14 = ScreenUtil().setSp(14.0);
  static double spScreen15 = ScreenUtil().setSp(15.0);
  static double spScreen16 = ScreenUtil().setSp(16.0);
  static double spScreen17 = ScreenUtil().setSp(17.0);
  static double spScreen18 = ScreenUtil().setSp(18.0);
  static double spScreen19 = ScreenUtil().setSp(19.0);
  static double spScreen20 = ScreenUtil().setSp(20.0);
  static double spScreen21 = ScreenUtil().setSp(21.0);
  static double spScreen22 = ScreenUtil().setSp(22.0);
  static double spScreen23 = ScreenUtil().setSp(23.0);
  static double spScreen24 = ScreenUtil().setSp(24.0);
  static double spScreen25 = ScreenUtil().setSp(25.0);
  static double spScreen26 = ScreenUtil().setSp(26.0);
  static double spScreen27 = ScreenUtil().setSp(27.0);
  static double spScreen28 = ScreenUtil().setSp(28.0);
  static double spScreen29 = ScreenUtil().setSp(29.0);
  static double spScreen30 = ScreenUtil().setSp(30.0);
}

class AppTheme {
  static getThemeData(int color) {
    ThemeData themData = ThemeData(
      //- Color类型，App主要部分的背景色（ToolBar,Tabbar等）
      primaryColor: Color(color == 0 ? colorPrimary.value : color),
      //- Color类型，primaryColor的较暗版本。(顶部状态栏)
      primaryColorDark: Color(colorPrimaryDark.value),
      //作为Scaffold基础的Material默认颜色，典型Material应用或应用内页面的背景颜色(背景色)
      scaffoldBackgroundColor: Color(scaffoldBackgroundColor.value),
      //Color类型，与primaryColor对比的颜色(例如 用作进度条的剩余部分)。
      //backgroundColor: Color(teal700Color.value),
      //- Color类型，前景色（文本、按钮等）
      accentColor: colorAccent,
      //- Brightness类型，accentColor的亮度。 用于确定放置在突出颜色顶部的文本和图标的颜色（例如FloatingButton上的图标）。
      //accentColorBrightness:Brightness.light,
      //- IconThemeData类型，与突出颜色对照的图片主题。
      //accentIconTheme:IconThemeData.fallback(),
      //- TextTheme类型，与突出颜色对照的文本主题。
      //accentTextTheme:
      //- Color类型，BottomAppBar的默认颜色。
      //bottomAppBarColor:colorPrimaryDark,
      //- Brightness类型，应用程序整体主题的亮度。 由按钮等Widget使用，以确定在不使用主色或强调色时要选择的颜色。
      //brightness: Brightness.light,
      //- Color类型，Material中RaisedButtons使用的默认填充色。
      //buttonColor: Colors.white,
      //- ButtonThemeData类型，定义了按钮等控件的默认配置，像RaisedButton和FlatButton。
      //buttonTheme:
      //canvasColor - Color类型，MaterialType.canvas Material的默认颜色。
      //cardColor - Color类型，Material被用作Card时的颜色。
      //chipTheme - ChipThemeData类型，用于渲染Chip的颜色和样式。
      //dialogBackgroundColor - Color类型，Dialog元素的背景色。
      //disabledColor - Color类型，用于Widget无效的颜色，无论任何状态。例如禁用复选框。
      //dividerColor - Color类型，Dividers和PopupMenuDividers的颜色，也用于ListTiles中间，和DataTables的每行中间.
      //errorColor - Color类型，用于输入验证错误的颜色，例如在TextField中。
      //hashCode - int类型，这个对象的哈希值。
      //highlightColor - Color类型，用于类似墨水喷溅动画或指示菜单被选中的高亮颜色。
      //hintColor - Color类型，用于提示文本或占位符文本的颜色，例如在TextField中。
      //iconTheme - IconThemeData类型，与卡片和画布颜色形成对比的图标主题。
      //indicatorColor - Color类型，TabBar中选项选中的指示器颜色。
      //inputDecorationTheme - InputDecorationTheme类型，InputDecorator，TextField和TextFormField的默认InputDecoration值基于此主题。
      //platform - TargetPlatform类型，Widget需要适配的目标类型。
      //primaryColorBrightness - Brightness类型，primaryColor的亮度。
      //primaryColorDark - Color类型，primaryColor的较暗版本。
      //primaryColorLight - Color类型，primaryColor的较亮版本。
      //primaryIconTheme - IconThemeData类型，一个与主色对比的图片主题。
      //primaryTextTheme - TextThemeData类型，一个与主色对比的文本主题。
      //scaffoldBackgroundColor - Color类型，作为Scaffold基础的Material默认颜色，典型Material应用或应用内页面的背景颜色。
      //secondaryHeaderColor - Color类型，有选定行时PaginatedDataTable标题的颜色。
      //selectedRowColor - Color类型，选中行时的高亮颜色。
      //sliderTheme - SliderThemeData类型，用于渲染Slider的颜色和形状。
      //splashColor - Color类型，墨水喷溅的颜色。
      //splashFactory - InteractiveInkFeatureFactory类型，定义InkWall和InkResponse生成的墨水喷溅的外观。
      //textSelectionColor - Color类型，文本字段中选中文本的颜色，例如TextField。
      //textSelectionHandleColor - Color类型，用于调整当前文本的哪个部分的句柄颜色。
      //textTheme - TextTheme类型，与卡片和画布对比的文本颜色。
      //toggleableActiveColor - Color类型，用于突出显示切换Widget（如Switch，Radio和Checkbox）的活动状态的颜色。
      //unselectedWidgetColor - Color类型，用于Widget处于非活动（但已启用）状态的颜色。 例如，未选中的复选框。 通常与accentColor形成对比。
      //runtimeType - Type类型，表示对象的运行时类型。
      fontFamily: 'Aleo',
      //作为Scaffold基础的Material默认颜色，典型Material应用或应用内页面的背景颜色(背景色)
      // scaffoldBackgroundColor: Colors.red,
      //accentColorBrightness:Brightness.dark,
    );
    return themData;
  }
}

class TextStyles {
  static TextStyle textStyle(
      {double fontSize: Dimens.font_sp12,
      Color color: Colors.white,
      FontWeight fontWeight}) {
    return TextStyle(
        fontSize: fontSize,
        color: color,
        decoration: TextDecoration.none,
        fontWeight: fontWeight);
  }

  static TextStyle textRed12 = textStyle(color: Colors.red);
  static TextStyle textBlue12 = textStyle(color: Colors.blueAccent);
  static TextStyle textWhite12 = textStyle();
  static TextStyle textGreyC12 = textStyle(color: grey900Color);
  static TextStyle textGrey12 = textStyle(color: Colors.grey);
  static TextStyle textDark12 = textStyle(color: grey900Color);
  static TextStyle textBoldDark12 = textStyle(color: Colors.black);
  static TextStyle textBoldWhile12 = textStyle(fontWeight: FontWeight.bold);

  static TextStyle textWhite14 = textStyle(fontSize: Dimens.font_sp14);
  static TextStyle textRed14 =
      textStyle(fontSize: Dimens.font_sp14, color: Colors.red);
  static TextStyle textReader14 =
      textStyle(fontSize: Dimens.font_sp14, color: grey900Color);
  static TextStyle textBlue14 =
      textStyle(fontSize: Dimens.font_sp14, color: Colors.blueAccent);
  static TextStyle textGreyC14 =
      textStyle(fontSize: Dimens.font_sp14, color: grey900Color);
  static TextStyle textGrey14 =
      textStyle(fontSize: Dimens.font_sp14, color: Colors.grey);
  static TextStyle textDark14 =
      textStyle(fontSize: Dimens.font_sp14, color: grey900Color);
  static TextStyle textBoldDark14 = textStyle(
      fontSize: Dimens.font_sp14,
      color: Colors.black,
      fontWeight: FontWeight.bold);
  static TextStyle textBoldWhile14 =
      textStyle(fontSize: Dimens.font_sp14, fontWeight: FontWeight.bold);

  static TextStyle textReader16 =
      textStyle(fontSize: Dimens.font_sp16, color: grey900Color);
  static TextStyle textRed16 =
      textStyle(fontSize: Dimens.font_sp16, color: Colors.red);
  static TextStyle textBlue16 =
      textStyle(fontSize: Dimens.font_sp16, color: Colors.blueAccent);
  static TextStyle textWhite16 = textStyle(fontSize: Dimens.font_sp16);
  static TextStyle textGreyC16 =
      textStyle(fontSize: Dimens.font_sp16, color: grey900Color);
  static TextStyle textGrey16 =
      textStyle(fontSize: Dimens.font_sp16, color: Colors.grey);
  static TextStyle textDark16 =
      textStyle(fontSize: Dimens.font_sp16, color: grey900Color);
  static TextStyle textBoldDark16 = textStyle(
      fontSize: Dimens.font_sp16,
      color: Colors.black,
      fontWeight: FontWeight.bold);
  static TextStyle textBoldWhile16 = textStyle(
      fontSize: Dimens.font_sp16,
      color: Colors.white,
      fontWeight: FontWeight.bold);

  static TextStyle textBoldDark20 = textStyle(
      fontSize: Dimens.font_sp20,
      color: Colors.black,
      fontWeight: FontWeight.bold);

  static TextStyle textBoldDark26 = textStyle(
      fontSize: Dimens.font_sp26,
      color: Colors.black,
      fontWeight: FontWeight.bold);

  static TextStyle textBoldWhile40 =
      textStyle(fontSize: Dimens.font_sp40, fontWeight: FontWeight.w400);
}

const IconThemeData lightIconTheme = IconThemeData(color: Colors.black54);
