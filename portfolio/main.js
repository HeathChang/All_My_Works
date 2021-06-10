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

});



//Handle Scrolling when tapping on the navbar menu
const navbarMenu= document.querySelector('.navbar__menu');
navbarMenu.addEventListener('click',()=>{
  const target= event.target;
  const link =target.dataset.link
  if(link == null) {
    return;
  }
  navbarMenu.classList.remove('open');
  scrollIntoView(event.target.dataset.link); //함수화
  //console.log(event.target.dataset.link); //target-> li값 & dataset dom && link : value
  //const scrollTo=document.querySelector(link); //링크 쿼리를 가져와라
  //scrollTo.scrollIntoView({behavior:'smooth'});
})

//Navbar toggle button for small screen
const navbarToggleBtn = document.querySelector('.navbar_toggle-btn');
navbarToggleBtn.addEventListener('click',()=>{
  navbarMenu.classList.toggle('open');
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

///Show Arrow up btn when scroll
const arrowUp = document.querySelector(".arrow-up");
document.addEventListener('scroll',()=>{
  if(window.scrollY > homeHeight / 2 ){
    arrowUp.classList.add('visible');
  }else{
    arrowUp.classList.remove('visible');
  }
})

//Handle Click on the "arrow up" btn
arrowUp.addEventListener('click',()=>{
  scrollIntoView("#home");
})




//Projects
const workBtnContainer=document.querySelector('.work_categories');
const projectContainer=document.querySelector('.work_projects');
const projects = document.querySelectorAll('.project');
workBtnContainer.addEventListener('click',(event)=>{
  const filter = event.target.dataset.filter||event.target.parentNode.dataset.filter;
  if(filter==null){
    return;
  }
  projectContainer.classList.add('anim-out');
  //remove selection from the previous item and select the new item
  const active= document.querySelector('.category__btn.selected')
  active.classList.remove('selected');
  const target = 
    event.target.nodeName ==='BUTTON'? event.target: event.target.parentNode;
  target.classList.add('selected');

  setTimeout(()=>{
    projects.forEach((project)=>{
      if(filter==="*"||filter===project.dataset.type){
        project.classList.remove('invisible');
      }else{
        project.classList.add('invisible');
      }
  })
    projectContainer.classList.remove('anim-out');

  },300);
})

/////////////Utility 함수/////////////


function scrollIntoView(selector){
  const scrollInto= document.querySelector(selector);
  scrollInto.scrollIntoView({behavior:'smooth'})
}


