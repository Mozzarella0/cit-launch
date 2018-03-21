<app>
  <app-header/>
  <div id="content"></div>
  <app-footer/>

  <script>
    import firebase from '../firebase-config';
    import route from 'riot-route';
    import './core/header.tag';
    import './core/footer.tag';
    import './pages/home.tag';
    import './pages/snara.tag';
    import './pages/tsuda.tag';
    import './pages/info.tag';

    const mounthing = (content, param, headparam) => {
      $('#content').hide();
      riot.mount('#content', content, param);
      riot.mount('app-header', 'app-header', headparam);
      $('#content').fadeIn();
    };

    window.hankana2zenkana = (str) => {
      const kanaMap = {
        'ｶﾞ': 'ガ', 'ｷﾞ': 'ギ', 'ｸﾞ': 'グ', 'ｹﾞ': 'ゲ', 'ｺﾞ': 'ゴ',
        'ｻﾞ': 'ザ', 'ｼﾞ': 'ジ', 'ｽﾞ': 'ズ', 'ｾﾞ': 'ゼ', 'ｿﾞ': 'ゾ',
        'ﾀﾞ': 'ダ', 'ﾁﾞ': 'ヂ', 'ﾂﾞ': 'ヅ', 'ﾃﾞ': 'デ', 'ﾄﾞ': 'ド',
        'ﾊﾞ': 'バ', 'ﾋﾞ': 'ビ', 'ﾌﾞ': 'ブ', 'ﾍﾞ': 'ベ', 'ﾎﾞ': 'ボ',
        'ﾊﾟ': 'パ', 'ﾋﾟ': 'ピ', 'ﾌﾟ': 'プ', 'ﾍﾟ': 'ペ', 'ﾎﾟ': 'ポ',
        'ｳﾞ': 'ヴ', 'ﾜﾞ': 'ヷ', 'ｦﾞ': 'ヺ',
        'ｱ': 'ア', 'ｲ': 'イ', 'ｳ': 'ウ', 'ｴ': 'エ', 'ｵ': 'オ',
        'ｶ': 'カ', 'ｷ': 'キ', 'ｸ': 'ク', 'ｹ': 'ケ', 'ｺ': 'コ',
        'ｻ': 'サ', 'ｼ': 'シ', 'ｽ': 'ス', 'ｾ': 'セ', 'ｿ': 'ソ',
        'ﾀ': 'タ', 'ﾁ': 'チ', 'ﾂ': 'ツ', 'ﾃ': 'テ', 'ﾄ': 'ト',
        'ﾅ': 'ナ', 'ﾆ': 'ニ', 'ﾇ': 'ヌ', 'ﾈ': 'ネ', 'ﾉ': 'ノ',
        'ﾊ': 'ハ', 'ﾋ': 'ヒ', 'ﾌ': 'フ', 'ﾍ': 'ヘ', 'ﾎ': 'ホ',
        'ﾏ': 'マ', 'ﾐ': 'ミ', 'ﾑ': 'ム', 'ﾒ': 'メ', 'ﾓ': 'モ',
        'ﾔ': 'ヤ', 'ﾕ': 'ユ', 'ﾖ': 'ヨ',
        'ﾗ': 'ラ', 'ﾘ': 'リ', 'ﾙ': 'ル', 'ﾚ': 'レ', 'ﾛ': 'ロ',
        'ﾜ': 'ワ', 'ｦ': 'ヲ', 'ﾝ': 'ン',
        'ｧ': 'ァ', 'ｨ': 'ィ', 'ｩ': 'ゥ', 'ｪ': 'ェ', 'ｫ': 'ォ',
        'ｯ': 'ッ', 'ｬ': 'ャ', 'ｭ': 'ュ', 'ｮ': 'ョ',
        '｡': '。', '､': '、', 'ｰ': 'ー', '｢': '「', '｣': '」', '･': '・'
      };

      const reg = new RegExp('(' + Object.keys(kanaMap).join('|') + ')', 'g');
      return str
      .replace(reg, (match) => {
        return kanaMap[match];
      })
      .replace(/ﾞ/g, '゛')
      .replace(/ﾟ/g, '゜');
    };

    const dating = new Date();
    const year = dating.getFullYear();
    const month = dating.getMonth()+1;
    const date = dating.getDate();
    const day = dating.getDay();
    const week = ['Sun', 'Mon', 'Tues', 'Wed', 'Thurs', 'Fri', 'Sat'];
    const nowdate = `${ year }/${ month }/${ date } ${ week[day] }`;

    route('/', () => {
      mounthing('app-home', {}, { page : 'home' })
    });
    route('/snara', () => {
      mounthing('app-snara' , { nowdate : nowdate, day : day }, { page : 'snara' })
    });
    route('/tsuda', () => {
      mounthing('app-tsuda' , { nowdate : nowdate, day : day }, { page : 'tsuda' })
    });
    route('/info', () => {
      mounthing('app-info' , { nowdate : nowdate, day : day }, { page : 'tsuda' })
    });


  </script>

  <style>

  </style>

</app>
