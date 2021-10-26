<form method="Post">
    <div>
    <h4>Para cadastrar um funcionário, primeiro deve fazer o cadastro do usuário.</h4>
            <h5>Se já fez, coloque a informação abaixo:</h5>
        <label for="codusu" class="forma-label">Digite o código do Usuário</label>
        <input type="number" name="codUsu" id="codusu" class="form-control" placeholder="Exemplo: 123">
    </div>
    <div class="col-12">
        <button type="submit" class="btn btn-primary">Buscar</button>
    </div>
</form>

<?php
$request = service('request');

$codusu = isset($usuario->codusu)? $usuario->codusu : 0;
$emailUsu = isset($usuario->emailUsu)?$usuario->emailUsu:"";

if($codusu){

?>

    <form method="Post">
        <div class="mb-3">
            
            <label for="codUsu" class="form-label">Código Usuário</label>
            <input type="text" class="form-control" id="codUsu" value="<?=$codusu?>" name="codUsu" readonly aria-describedby="nomeHelp">
        </div>

        <div class="mb-3">
            <label for="emailUsu" class="form-label">Email Usuário</label>
            <input type="email" class="form-control" id="emailUsu" value="<?=$emailUsu?>" name="emailUsu" readonly aria-describedby="nomeHelp" >
        </div>

        <div class="mb-3">
            <label for="nome" class="form-label">Nome</label>
            <input type="text" class="form-control" id="nome" name="nomefun" aria-describedby="nomeHelp" required>
        </div>

        <div class="mb-3">
            <label for="fone" class="form-label">Fone</label>
            <input type="text" class="form-control" id="fone" name="fonefun" required>
        </div>

        <button type="submit" class="btn btn-primary">Cadastrar</button>
    </form>

<?php
}
?>
