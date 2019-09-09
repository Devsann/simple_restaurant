<template>
    <div class="content" >
      <div class="container-fluid" v-if="$gate.isAdmin()">
        <div class="row" v-if="userList">
            <div class="col-md-12">
              <div class="card">
                <div class="card-header card-header-primary">
                  <h4 class="card-title ">Users List Tables</h4>
                      <router-link to="/user/create">
                      <a href="" class="btn btn-success btn-sm pull-right">Add New
                      <i class="material-icons" style="font-size:25px;color:white">person_add</i>
                      </a>
                    </router-link>
                  <p class="card-category"> Here is a users name for this table</p>
                </div>
                <div class="card-body">
                  <div class="table-responsive">
                    <table class="table">
                      <thead class=" text-primary">
                        <th> ID </th>
                        <th> Name </th>
                        <th> Email </th>
                        <th> Type </th>
                        <th>Registered At</th>
                        <th> Actions </th>
                      </thead>
                      <tbody>
                        <tr v-for="(user, index) in users" :key="user.id">
                          <td> {{ index+1 }} </td>
                          <td> {{ user.name }} </td>
                          <td> {{ user.email }} </td>
                          <td> {{ user.type | upText }} </td>
                          <td> {{ user.created_at | myDate}} </td>
                          <td class="text-primary" >
                              <a href="#" @click="editUser(index)">
                                  <i class="material-icons" style="color:orange">create</i>
                              </a>/
                              <a href="#" @click="deleteUser(user.id)">
                                  <i class="material-icons" style="color:red">delete_sweep</i>
                              </a>
                          </td>
                        </tr>
                        <tr>
                          <td></td>
                          <td> </td>
                          <td></td>
                          <td></td>
                          <td></td>
                          <td class="text-primary"> </td>
                        </tr>
                        
                      </tbody>
                    </table>
                  </div>
                </div>
              </div>
            </div>
          </div>

          <div class="row" v-if="editOpen">
            <div class="col-md-12">
              <div class="card">
                <div class="card-header card-header-info">
                    <h4 class="card-title">Edit Users</h4>
                    <p class="card-category">Complete your Users</p>
                </div>
                <div class="card-body">
                  <form @submit.prevent="updateUser">
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
                          <button type="button" class="btn btn-danger" data-dismiss="modal" @click="updateClose">Cancel</button>
                          <button type="submit" class="btn btn-primary">Update Now</button>
                        </div>
                    </form>
                  </div>
              </div>
            </div>
          </div>

      </div>
      <div v-if="!$gate.isAdmin()">
        <not-found></not-found>
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
