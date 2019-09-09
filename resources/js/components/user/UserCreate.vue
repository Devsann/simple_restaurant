<template>
    <div class="content">
        <div class="container-fluid">
          <div class="row">
            <div class="card">
                    <div class="card-header card-header-success">
                        <h4 class="card-title">Users Creator</h4>
                        <p class="card-category">Create Users Complete</p>
                    </div>
                    <div class="card-body">
                        <form @submit.prevent="createUser">
                            <div class="modal-body">
                                <div class="form-group">
                                    <input v-model="form.name" type="text" name="name" placeholder="Enter UserName"
                                    class="form-control" :class="{ 'is-invalid': form.errors.has('name') }">
                                    <has-error :form="form" field="name"></has-error>
                                </div>

                                <div class="form-group">
                                    <input v-model="form.email" type="email" name="email" placeholder="Enter Email / abcd@gmail.com"
                                    class="form-control" :class="{ 'is-invalid': form.errors.has('email') }">
                                    <has-error :form="form" field="email"></has-error>
                                </div>

                                <div class="form-group">
                                    <textarea v-model="form.bio" name="bio" id="bio"
                                    placeholder="Short bio for user (Optional)"
                                    class="form-control" :class="{ 'is-invalid': form.errors.has('bio') }"></textarea>
                                    <has-error :form="form" field="bio"></has-error>
                                </div>

                                <div class="form-group">
                                    <select name="type" v-model="form.type" id="type" class="form-control" :class="{ 'is-invalid': form.errors.has('type') }">
                                        <option value="">Select User Role</option>
                                        <option value="admin">Admin</option>
                                        <option value="user">Standard User</option>
                                        <option value="author">Author</option>
                                    </select>
                                    <has-error :form="form" field="type"></has-error>
                                </div>

                                <div class="form-group">
                                    <input v-model="form.password" type="password" name="password" 
                                    placeholder="Enter Password" class="form-control" 
                                    :class="{ 'is-invalid': form.errors.has('password') }">
                                    <has-error :form="form" field="password"></has-error>
                                </div>

                            </div>
                                <div class="modal-footer">
                                    <router-link to="/user">
                                        <button type="button" class="btn btn-danger" data-dismiss="modal">Back</button>
                                    </router-link>
                                <button type="submit" class="btn btn-primary">Create New</button>
                                </div>
                            </form>
                    </div>
                </div>

          </div>
        </div>
    </div>
</template>

<script>
   export default {
      data(){
        return{
          form: new Form({
            name:'',
            email:'',
            password:'',
            type:'',
            bio:'',
            photo:'',
          }),
          users:{}
        }
      },

      created(){
        this.loadUser();
        Fire.$on('AfterCreate',()=>{
          this.loadUser();
        });
      },

      methods:{
        createUser(){
          this.$Progress.start();
          this.form.post('/api/user')
          .then(res => {
            this.$router.push({
                name:'usercreate'
            });
          Fire.$emit('AfterCreate');

          Toast.fire({
            type: 'success',
            title: 'User Created is successfully'
          })
          this.$Progress.finish();
          }).catch();


        },

        loadUser(){
          axios.get('/api/user')
          .then(res=>{
            console.log(res.data.data);
            this.users=res.data.data;
          });
        }
      },
    }
</script>
