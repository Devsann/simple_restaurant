<template>
    <div id="notfound">
		<div class="notfound">
			<div class="notfound-404">
				<h1>404</h1>
				<h2>Page not found</h2>
			</div>
			<a href="#">Homepage</a>
		</div>
	</div>
</template>

<script>
    export default {
      data(){
        return{
          form : new Form({
              id:'',
              name:'',
              email:'',
              password: '',
              type:'',
              bio:'',
              photo:'',
          }),

          users:{},

          userList:true,

          editOpen:false
        }
      },

      created(){
        this.loadUser();
        Fire.$on('AfterCreate',()=>{
          this.loadUser();
        });
      },

      methods:{
        loadUser(){
          if (this.$gate.isAdmin()) {
            axios.get('/api/user')
            .then(res=>{
              console.log(res.data.data);
              this.users=res.data.data;
            });
          }
        },
        
        updateUser(){
          axios.patch(`/api/user/${this.form.id}`,this.form)
          .then(res=>{
            this.editOpen=false;
            this.userList=true;
            swal.fire(
                  'Updated !!',
                  'Your file has been updated.',
                  'success'
            )
            Fire.$emit('AfterCreate');
          }).catch(()=>{
            swal.fire(
                  'Errors!',
                  'Not UPdated ... Something wrong ..Sir!!.',
                  'warning'
                )
          })
        },

        deleteUser(id){
          swal.fire({
            title: 'Are you sure?',
            text: "You won't be able to revert this!",
            type: 'warning',
            showCancelButton: true,
            confirmButtonColor: '#3085d6',
            cancelButtonColor: '#d33',
            confirmButtonText: 'Yes, delete it!'
          }).then((result) => {
            if (result.value) {
              this.form.delete('api/user/'+id).then(() =>{
                swal.fire(
                  'Deleted!',
                  'Your file has been deleted.',
                  'success'
                )
                Fire.$emit('AfterCreate');
              }).catch(()=>{
                swal.fire(
                  'Errors!',
                  'Not Deleted ... Something wrong ..Sir!!.',
                  'warning'
                )
              });
            }
          })
        },

        editUser(index){
          this.userList = false;
          this.editOpen = true;
          this.form.name = this.users[index].name;
          this.form.email = this.users[index].email;
          this.form.bio = this.users[index].bio;
          this.form.type = this.users[index].type;
          this.form.password = this.users[index].password;
          this.form.id = this.users[index].id;
          // this.form.reset();
          // $('#addNew').modal('show');
          // this.form.fill(user);
        },

        updateClose(){
          this.userList = true;
          this.editOpen = false;
        }
      },
    }
</script>
