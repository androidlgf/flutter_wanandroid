class Api {
  //玩Android api接口
  static const WAN_HOST = 'https://www.wanandroid.com';

  //1.2 首页banner
  static const WAN_BANNER = WAN_HOST + '/banner/json';

  //1.1 首页文章列表
  static const WAN_ARTICLE = WAN_HOST + '/article/list/';

  //2.1 体系数据
  static const WAN_SYSTEM = WAN_HOST + '/tree/json';

  //2.2 知识体系下的文章
  static const WAN_SYSTEM_ARTICLE = WAN_HOST + '/article/list/';

  //4.1 项目分类
  static const WAN_PROJECT = WAN_HOST + '/project/tree/json';

  //4.2 项目列表数据
  static const WAN_PROJECT_LIST = WAN_HOST + '/project/list/';

  //1.4 搜索热词
  static const WAN_SEARCH_HOT = WAN_HOST + '/hotkey/json';

  //iBrand 开源电商
  static const IbRAND_HOST = 'https://demo-open-admin.ibrand.cc/api';

  //首页中的幻灯片和分类商品数据
  static const IbRAND_HOME = IbRAND_HOST + '/home';

  //商品详情页/store/detail/{id}
  static const IbRAND_DETAIL = IbRAND_HOST + '/store/detail/';

  //百姓生活 开源电商
  static const LIFE_HOST = 'http://v.jspang.com:8088/baixing/wxmini';

  //百姓生活 首页
  static const LIFE_HOME = LIFE_HOST + '/homePageContent';

  //百姓生活 热门商品
  static const LIFE_HOME_HOT = LIFE_HOST + '/homePageBelowConten';

  //百姓生活 商品详情
  static const LIFE_GOODS_DETAIL = LIFE_HOST + '/getGoodDetailById';

  //百姓生活 商品分类
  static const LIFE_GOODS_CATEGORY = LIFE_HOST + '/getCategory';
}
