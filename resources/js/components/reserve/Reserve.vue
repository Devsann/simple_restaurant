<template>
    <div class="content">
        <div class="container-fluid">
          <div class="row" v-if="reserveForm">
            <div class="card">
                    <div class="card-header card-header-success">
                        <h4 class="card-title">Request For Sales</h4>
                        <p class="card-category">Create Requests Complete</p>
                    </div>
                    <div class="card-body">
                        <div class="row justify-content-md-center">
                            <div class="col-lg-5 res_form">
                                <form @submit.prevent="createReserve">
                                    <div class="form-row">
                                        <div class="form-group col-md-6">
                                            <input v-model="form.name" type="text" name="name" placeholder="Enter Name"
                                            class="form-control" :class="{ 'is-invalid': form.errors.has('name') }">
                                            <has-error :form="form" field="name"></has-error>
                                        </div>

                                        <div class="form-group col-md-6">
                                            <input v-model="form.phone" type="phone" name="phone"
                                            placeholder="Enter phone" class="form-control" 
                                            :class="{ 'is-invalid': form.errors.has('phone') }">
                                            <has-error :form="form" field="phone"></has-error>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <input v-model="form.email" type="email" name="email" 
                                        placeholder="Enter email" class="form-control"
                                        :class="{ 'is-invalid': form.errors.has('email') }">
                                        <has-error :form="form" field="email"></has-error>
                                    </div>

                                    <div class="form-group">
                                        <textarea v-model="form.message" name="message" id="message"
                                        placeholder="Short Message for user (Optional)"
                                        class="form-control" :class="{ 'is-invalid': form.errors.has('message') }"></textarea>
                                        <has-error :form="form" field="message"></has-error>
                                    </div>
                                    <div class="form-row">
                                        <div class="form-group col-md-2">
                                            <button type="button" class="btn btn-danger" @click="reserveFormClosed">Closed</button>
                                        </div>
                                        <div class="form-group col-md-10">
                                            <button type="submit" class="btn btn-primary btn-block">Create New</button>
                                        </div>
                                    </div>
                                </form>
                            </div>

                            <div class="col-lg-1">
                                
                            </div>

                            <div class="col-lg-5">
                                <div class="card">
                                    <div class="card-body text-primary p_body item_img">
                                        <p class="card-text p_text1">Lorem ipsum dolor sit, amet consectetur adipisicing elit. Ipsum deleniti aliquam culpa amet rem temporibus facere sapiente, dolore quasi itaque maiores dolores ex voluptatem possimus officiis molestias praesentium labore officia.</p>
                                    </div>
                                </div>
                            </div>

                            <div class="col-lg-1">
                                
                            </div>
                        </div>
                    </div>
                </div>
          </div>

          <div class="row" v-else>
            <div class="col-md-12">
              <div class="card">
                <div class="card-header card-header-info">
                  <h4 class="card-title ">Request List Tables</h4>
                      <a class="btn bg-secondary btn-sm pull-right" @click="reserveNewBtn">Add New
                      <i class="material-icons" style="font-size:25px;color:white">queue</i>
                      </a>
                  <p class="card-category"> Here is a Request name for this table</p>
                </div>
                <div class="card-body">
                  <div class="table-responsive">
                    <table class="table">
                      <thead class=" text-primary">
                        <th>NO.</th>
                        <th> Name </th>
                        <th> Phone</th>
                        <th>Email</th>
                        <th> Messages</th>
                        <th> Status / Confirming</th>
                        <th> Actions</th>
                        <th> Date / Time</th>
                      </thead>
                      <tbody>
                        <tr v-for="(reserve,index) in reserveList" :key="reserve.id">
                          <td>{{ index+1 }}</td>
                          <td>{{ reserve.name }}</td>
                          <td>{{ reserve.phone }}</td>
                          <td>{{ reserve.email }}</td>
                          <td>{{ reserve.message }}</td>
                          <td v-if="(reserve.status == true)">
                              <span class="badge badge-info">Confirmed Yes</span>
                          </td> 
                          <td v-else>
                              <span class="badge badge-danger">Not Confirmed Yet</span>
                          </td>

                          <td v-if="(reserve.status == false)">
                                <button type="button" class="btn btn-info btn-sm" @click="confirmClick(reserve.id)"><i class="material-icons">done</i></button>
                          </td>

                          <td class="text-primary" v-else>
                                <button type="button" class="btn btn-danger btn-sm" @click="deleteReserve(reserve.id)"><i class="material-icons" style="color:white">delete_sweep</i></button>
                          </td>
                          <td>{{ reserve.created_at }}</td>
                          </tr>
                          <tr>
                          <td></td>
                          <td> </td>
                          <td></td>
                          <td></td>
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

        </div>
    </div>
</template>
<script>
export default {
    data(){
        return{
            form: new Form({
            id:'',
            name:'',
            email:'',
            phone:'',
            message:'',
          }),
          reserveForm:false,
          reserveList:{}
        //   reserveTable:true,
        }
    },
    created(){
        this.getReserveList();
        Fire.$on('AfterCreateReserve',()=>{
            this.getReserveList()
        })
    },

    methods:{
        createReserve(){
            this.form.post('/api/reserve')
            .then(res=>{
                // console.log(res);
                this.reserveForm=false,
                Fire.$emit('AfterCreateReserve'),

                Toast.fire({
                    type: 'success',
                    title: 'User Created is successfully'
                })
            })
            .catch();
        },

        getReserveList(){
            axios.get('/api/reserve')
            .then(res=>{
                this.reserveList=res.data.data
            })
        },

        deleteReserve(id){
            swal.fire({
                    title: 'Are you sure?',
                    text: "Are you verify this request by phone? !",
                    type: 'warning',
                    showCancelButton: true,
                    confirmButtonColor: '#3085d6',
                    cancelButtonColor: '#d33',
                    confirmButtonText: 'Yes, delete it!'
                    }).then((result) => {

                        if (result.value) {
                            axios.delete('/api/reserve/'+id).then(() =>{
                                
                                    swal.fire(
                                    'Confirmed!',
                                    'Are you verify this request by phone?',
                                    'success'
                                    )
                                    Fire.$emit('AfterCreateReserve')
                            }).catch(() =>{
                                swal.fire(
                                    'error!',
                                    'You are Not Admin .. NoDeleted Sir !!',
                                    'warning'
                                )
                            });

                        }
                })
        },

        confirmClick(id){
            swal.fire({
                    title: 'Are you sure?',
                    text: "Are you verify this request by phone?",
                    type: 'warning',
                    showCancelButton: true,
                    confirmButtonColor: '#3085d6',
                    cancelButtonColor: '#d33',
                    confirmButtonText: 'Yes, delete it!'
                    }).then((result) => {

                        if (result.value) {
                            axios.post('/api/reserve/'+id).then(() =>{
                                
                                    swal.fire(
                                    'Deleted!',
                                    'Are you verify this request by phone?',
                                    'success'
                                    )
                                    Fire.$emit('AfterCreateReserve')
                            }).catch(() =>{
                                swal.fire(
                                    'error!',
                                    'Something Wrongs Sir !!',
                                    'warning'
                                )
                            });

                        }
                })
        },

        reserveNewBtn(){
            this.reserveForm=true;
        },

        reserveFormClosed(){
            this.reserveForm=false;
        }
    }
}
</script>
<style scoped>
.res_form{
    
}
</style>
