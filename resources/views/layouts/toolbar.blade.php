<div class="sidebar" data-color="purple" data-background-color="white" data-image="{{ asset('/backend/img/sidebar-1.jpg') }}">
        <!--
          Tip 1: You can change the color of the sidebar using: data-color="purple | azure | green | orange | danger"
  
          Tip 2: you can also add an image using data-image tag
        -->
        <div class="logo">
          <a href="http://www.creative-tim.com" class="simple-text logo-normal">
            Creative Tim
          </a>
          <div class="info" style="margin-left:100px;">
            <a href="" class="d-block">{{ Auth::user()->name }}</a>
            <a href="" class="d-block">{{ Auth::user()->type }}</a>
          </div>
        </div>
        <div class="sidebar-wrapper">
          <ul class="nav">
            @can('isAdmin')
            <li class="nav-item">
              <router-link to="/dashboard" class="nav-link">
                <i class="material-icons" style="color:red">dashboard</i>
                <p>Dashboard</p>
              </a>
            </li>
            @endcan
            <li class="nav-item ">
              <router-link class="nav-link" to="/user">
                <i class="material-icons" style="color:blue">person</i>
                <p>User Profile</p>
              </a>
            </li>
            <li class="nav-item ">
              <router-link class="nav-link" to="/profile">
                <i class="material-icons" style="color:green">content_paste</i>
                <p>Profiles</p>
              </router-link>
            </li>
            <li class="nav-item ">
              <router-link to="/management" class="nav-link" href="#">
                <i class="material-icons" style="color:brown">library_books</i>
                <p>Management</p>
              </router-link>
            </li>
            <li class="nav-item ">
              <router-link to="/category" class="nav-link" href="#">
                <i class="material-icons" style="color:orange">bubble_chart</i>
                <p>Category</p>
              </router-link>
            </li>
            <li class="nav-item">
              <router-link to="/item" class="nav-link" href="#">
                <i class="material-icons" style="color:#eb6ccd">location_ons</i>
                <p>Items</p>
              </router-link>
            </li>
            <li class="nav-item">
              <router-link to="/reserve" class="nav-link" href="#">
                <i class="material-icons" style="color:blue">explore</i>
                <p>For Request</p>
              </router-link>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="#">
                <i class="material-icons" style="color:#61f261">notifications</i>
                <p>Notifications</p>
              </a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="{{ route('logout') }}"
                    onclick="event.preventDefault();
                                  document.getElementById('logout-form').submit();">
                    <i class="material-icons" style="color:#2a11ed">power_settings_new</i>
                    <p>{{ __('Logout') }}</p>
                  </a>

                  <form id="logout-form" action="{{ route('logout') }}" method="POST" style="display: none;">
                      @csrf
                  </form>
              </li>
            
          </ul>
        </div>
      </div>
      {{-- end SideBar --}}

      <div class="main-panel">
        <!-- Navbar -->
        <nav class="navbar navbar-expand-lg navbar-transparent navbar-absolute fixed-top ">
          <div class="container-fluid">
            <div class="navbar-wrapper">
              <a class="navbar-brand" href="#pablo">Hello !!!</a>
            </div>
            <button class="navbar-toggler" type="button" data-toggle="collapse" aria-controls="navigation-index" aria-expanded="false" aria-label="Toggle navigation">
              <span class="sr-only">Toggle navigation</span>
              <span class="navbar-toggler-icon icon-bar"></span>
              <span class="navbar-toggler-icon icon-bar"></span>
              <span class="navbar-toggler-icon icon-bar"></span>
            </button>
            <div class="collapse navbar-collapse justify-content-end">
              <form class="navbar-form">
                <div class="input-group no-border">
                  <input type="text" value="" class="form-control" placeholder="Search...">
                  <button type="submit" class="btn btn-white btn-round btn-just-icon">
                    <i class="material-icons">search</i>
                    <div class="ripple-container"></div>
                  </button>
                </div>
              </form>
              <ul class="navbar-nav">
                <li class="nav-item">
                  <a class="nav-link" href="#pablo">
                    <i class="material-icons">dashboard</i>
                    <p class="d-lg-none d-md-block">
                      Stats
                    </p>
                  </a>
                </li>
                <li class="nav-item dropdown">
                  <a class="nav-link" href="http://example.com" id="navbarDropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    <i class="material-icons">notifications</i>
                    <span class="notification">5</span>
                    <p class="d-lg-none d-md-block">
                      Some Actions
                    </p>
                  </a>
                  <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdownMenuLink">
                    <a class="dropdown-item" href="#">Mike John responded to your email</a>
                    <a class="dropdown-item" href="#">You have 5 new tasks</a>
                    <a class="dropdown-item" href="#">You're now friend with Andrew</a>
                    <a class="dropdown-item" href="#">Another Notification</a>
                    <a class="dropdown-item" href="#">Another One</a>
                  </div>
                </li>
                <li class="nav-item dropdown">
                    <a class="nav-link" href="#pablo" id="navbarDropdownProfile" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                      <i class="material-icons">person</i>
                      <p class="d-lg-none d-md-block">
                        Account
                      </p>
                    </a>
                    <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdownProfile">
                      <a class="dropdown-item" href="#">Profile</a>
                      <a class="dropdown-item" href="#">Settings</a>
                      <div class="dropdown-divider"></div>
                      <a class="dropdown-item" href="#">Log out</a>
                    </div>
                  </li>
              </ul>
            </div>
          </div>
        </nav>
        <!-- End Navbar -->