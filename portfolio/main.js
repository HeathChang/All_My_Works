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
  scrollIntoView(event.target.dataset.link); //함수화
  //console.log(event.target.dataset.link); //target-> li값 & dataset dom && link : value
  //const scrollTo=document.querySelector(link); //링크 쿼리를 가져와라
  //scrollTo.scrollIntoView({behavior:'smooth'});
})

//Handle click on "Contact me" button
const contactBtn = document.querySelector('.home__contact');
contactBtn.addEventListener('click',()=>{
  scrollIntoView(event.target.dataset.link); //함수화
  //const contactLink = event.target.dataset.link
  //console.log(contactLink);
  //document.querySelector(contactLink).scrollIntoView({behavior:'smooth'});
})

//Make home slowly fade to transparent as the window scorlls down. 
const home = document.querySelector(".home__container");
const homeHeight=home.getBoundingClientRect().height;
document.addEventListener('scroll',()=>{
  home.style.opacity= 1 - window.scrollY/homeHeight;
})


/////////////Utility 함수/////////////
function scrollIntoView(selector){
  const scrollInto= document.querySelector(selector);
  scrollInto.scrollIntoView({behavior:'smooth'})
}


