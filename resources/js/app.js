
/**
 * First we will load all of this project's JavaScript dependencies which
 * includes Vue and other libraries. It is a great starting point when
 * building robust, powerful web applications using Vue and Laravel.
 */

require('./bootstrap');

window.Vue = require('vue');

import { Form, HasError, AlertError } from 'vform';
import moment from 'moment';

import Gate from './Gate.js';
Vue.prototype.$gate = new Gate(window.user);


import swal from 'sweetalert2'
window.swal = swal;

const Toast = swal.mixin({
  toast: true,
  position: 'top-end',
  showConfirmButton: false,
  timer: 3000
});
window.Toast = Toast;


window.Form=Form;
Vue.component(HasError.name, HasError)
Vue.component(AlertError.name, AlertError)

// Vuetify
import Vue from 'vue'
import Vuetify from 'vuetify'
Vue.use(Vuetify)


import VueRouter from 'vue-router'
Vue.use(VueRouter)

import VueProgressBar from 'vue-progressbar'
Vue.use(VueProgressBar, {
  color: 'rgb(143, 255, 199)',
  failedColor: 'red',
  height: '3px'
})


let routes = [
    { path: '/', component: require('./components/home/HomeIndex.vue') },
    // { path: '/category/:id', component: require('./components/home/HomeSlug.vue') },

    { path: '/dashboard', component: require('./components/Dashboard.vue') },
    { path: '/user', component: require('./components/user/User.vue'),name:'usercreate' },
    { path: '/user/create', component: require('./components/user/UserCreate.vue'),name:'userlist' },
    { path: '/management', component: require('./components/Management.vue'),name:'manage' },
    { path: '/profile', component: require('./components/user/Profile.vue'),name:'profile' },
    { path: '*', component: require('./components/NotFound.vue'),name:'notfound' },

    { path: '/category', component: require('./components/category/CatIndex.vue'),name:'catindex' },
    { path: '/category/create', component: require('./components/category/CatCreate.vue'),name:'catcreate' },

    { path: '/item', component: require('./components/item/ItemIndex.vue'),name:'itemindex' },
    { path: '/item/create', component: require('./components/item/ItemCreate.vue'),name:'itemcreate' },
    { path: '/item/:slug', component: require('./components/home/HomeSlug.vue') },

    { path: '/reserve', component: require('./components/reserve/Reserve.vue') },

    { path: '/free', component: require('./components/Free.vue') },

  ]

  const router = new VueRouter({
    routes, // short for `routes: routes`
    mode: 'history',
  })

  Vue.filter('upText',function(text){
    return text.charAt(0).toUpperCase() + text.slice(1);
  });

  Vue.filter('myDate',function(created){
    return moment(created).format('MMMM Do YYYY');
  });

  window.Fire =new Vue();

/**
 * Next, we will create a fresh Vue application instance and attach it to
 * the page. Then, you may begin adding components to this application
 * or customize the JavaScript scaffolding to fit your unique needs.
 */

//  27 end

Vue.component(
  'passport-clients',
  require('./components/passport/Clients.vue')
);

Vue.component(
  'passport-authorized-clients',
  require('./components/passport/AuthorizedClients.vue')
);

Vue.component(
  'passport-personal-access-tokens',
  require('./components/passport/PersonalAccessTokens.vue')
);

Vue.component(
  'not-found',
  require('./components/NotFound.vue')
);

Vue.component(
  'checkout',
  require('./components/reserve/Checkout.vue')
);


Vue.component('example-component', require('./components/ExampleComponent.vue'));
Vue.component('vue-app', require('./components/VueApp.vue'));


const app = new Vue({
    el: '#app',
    router
});

