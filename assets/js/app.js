// We need to import the CSS so that webpack will load it.
// The MiniCssExtractPlugin is used to separate it out into
// its own CSS file.
import css from "../css/app.css"

import "phoenix_html"
import Vue from 'vue'
import HelloWorld from './components/HelloWorld'

if (document.getElementById('hello_world')) {
  new Vue({
    render: h => h(HelloWorld),
  }).$mount('#hello_world')
}