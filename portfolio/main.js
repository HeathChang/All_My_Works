'use strict';
//Make navbar
const navbar =document.querySelector('#navbar');
const navbarHeight=navbar.getBoundingClientRect().height;
document.addEventListener('scroll',()=>{

  if(window.scrollY>navbarHeight){
    navbar.classList.add('navbar--dark');
  }else{
    navbar.classList.remove('navbar--dark');
  }

})

//Handle Scrolling when tapping on the navbar menu
const navbarMenu = document.querySelector('.navbar__menu');
navbarMenu.addEventListener('click',()=>{
  const target= event.target;
  const link =target.dataset.link
  if(link == null) {
    return;
  }
  console.log(event.target.dataset.link); //target-> li값 & dataset dom && link : value
  const scrollTo=document.querySelector(link);
  scrollTo.scrollIntoView({behavior:'smooth'});
})