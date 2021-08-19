<?php

namespace App\Controllers;

Class Usuario extends BaseController{

    public function index(){
        echo view('header');
		echo view('cadUsuario');
		echo view('footer');
    }

    public function inserirUsuario(){
        
    }
    
}