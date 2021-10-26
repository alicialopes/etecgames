<form method="Post">
    <div>
        <h4>Busca o funcionário por código.</h4>
        <label for="codfun" class="forma-label">Digite o código do Funcionario</label>
        <input type="number" name="codFun" id="codfun" class="form-control" placeholder="Exemplo: 123">
    </div>
    <div class="col-12">
        <button type="submit" class="btn btn-primary">Buscar</button>
    </div>
</form>

<?php
$request = service('request');

$codfun = isset($funcionario->codFun) ? $funcionario->codFun : 0;
$nomeFun = isset($funcionario->nomeFun) ? $funcionario->nomeFun : "";
$foneFun = isset($funcionario->foneFun) ? $funcionario->foneFun : "";

if ($codfun) {

?>

    <form method="Post">
        <div class="mb-3">

            <label for="codFun" class="form-label">Código Funcionario</label>
            <input type="text" class="form-control" id="codFun" value="<?= $codfun ?>" name="codFunAlterar" readonly aria-describedby="nomeHelp">
        </div>

        <div class="mb-3">
            <label for="nomeFun" class="form-label">Nome</label>
            <input type="text" class="form-control" id="nomeFun" value="<?= $nomeFun ?>" name="nomeFun" aria-describedby="nomeHelp" required>
        </div>

        <div class="mb-3">
            <label for="fone" class="form-label">Fone</label>
            <input type="text" class="form-control" id="fone" value="<?= $foneFun ?>" name="foneFun" required>
        </div>


        <button type="submit" class="btn btn-primary">Alterar</button>
    </form><br> 

    <form method="Post">
        <input type="hidden" name="codFunExcluir" value="<? $codfun ?>">
        <button type="submit" class="btn btn-primary">Deletar</button>
    </form>

<?php
}
?>