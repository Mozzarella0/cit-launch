import route from 'riot-route';

const mounthing = (content, param = {}) => {
  $('#content').hide();
  riot.mount('#content', content, param);
  $('#content').fadeIn();
};

const dating = new Date('2018/05/21');
const year = dating.getFullYear();
const month = dating.getMonth()+1;
const date = dating.getDate();
const day = dating.getDay();
const week = ['Sun', 'Mon', 'Tues', 'Wed', 'Thurs', 'Fri', 'Sat'];
const nowdate = `${ year }/${ month }/${ date } ${ week[day] }`;

route('/', () => {
  mounthing('app-home')
});
route('/snara', () => {
  mounthing('app-lunch' , { nowdate : nowdate, day : day, place: 'snara' });
});
route('/tsuda', () => {
  mounthing('app-lunch' , { nowdate : nowdate, day : day, place: 'tsuda' });
});
route('/info', () => {
  mounthing('app-info');
});

// start routing!!!!!!!!!!!!
route.start(true);
