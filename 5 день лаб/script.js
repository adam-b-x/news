     var vue = new Vue({
     el:"#app",
data:{
            result1: 0,
            result2: 0,
            result3: 0,
            x: 0.13,

errors:[],
            txt1: null,
            txt2: null,
            txt3: null,
            txt4: null,
            txt5: null
     },
methods:{
         checkForm: function (e) {
             if (this.txt1 && this.txt2 && this.txt3 && this.txt4 && this.txt5){
                 return true;
             }
             this.errors=[];

             if (!this.txt1){
                 this.errors.push(' 1 ERROR');
                 
            }
            if (!this.txt2){
                this.errors.push(' 2 ERROR');
               
            }
            if (!this.txt3){
                this.errors.push(' 3 ERROR');
               
            }
            if (!this.txt4){
                this.errors.push(' 4 ERROR');
               
            }
            if (!this.txt5){
                this.errors.push(' 5 ERROR');
              
            }
        e.preventDefault();
        },
calc1: function(){
        
        this.result1 = eval(this.txt1 * this.txt3 *(this.txt5 / this.txt4)+eval(this.txt2));
        
        this.result2 = eval(this.result1* this.x);
        
        this.result3 = eval(this.result1 - this.result2);
        
        },
       
     }
 }) 
