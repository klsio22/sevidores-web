<?php
if (isset($_POST['BTEnvia'])) {
  //Variaveis de POST, Alterar somente se necessário
  //====================================================
  $nome = $_POST['nome'];
  $email = $_POST['email'];
  $telefone = $_POST['telefone'];
  $mensagem = $_POST['mensagem'];
  //====================================================
  //REMETENTE --> ESTE EMAIL TEM QUE SER VALIDO DO DOMINIO
  //====================================================
  $email_remetente = "email@doseudominio"; // deve ser uma conta de email do
  //====================================================
  //Configurações do email, ajustar conforme necessidade
  //====================================================
  $email_destinatario = "email@querecebe"; // pode ser qualquer email que
  $email_reply = "$email";
  $email_assunto = "Contato formmail"; // Este será o assunto da mensagem
  //====================================================
  //Monta o Corpo da Mensagem
  //====================================================
  $email_conteudo = "Nome = $nome \n";
  $email_conteudo .= "Email = $email \n";
  $email_conteudo .= "Telefone = $telefone \n";
  $email_conteudo .= "Mensagem = $mensagem \n";
  //====================================================
  //Seta os Headers (Alterar somente caso necessario)
  //====================================================
  $email_headers = implode("\n", array("From: $email_remetente", "ReplyTo: $email_reply", "Return-Path: $email_remetente", "MIME-Version: 1.0", "XPriority: 3", "Content-Type: text/html; charset=UTF-8"));
  //====================================================
  //Enviando o email
  //====================================================
  if (mail(
    $email_destinatario,
    $email_assunto,
    nl2br($email_conteudo),
    $email_headers
  )) {
    echo "</b>E-Mail enviado com sucesso!</b>";
  } else {
    echo "</b>Falha no envio do E-Mail!</b>";
  }
  //====================================================
}
?>

<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="stylesheet" href="styles.css">
  <title>Sorveteria</title>
</head>

<body>
  <?php include('header.php'); ?>

  <form action="resposta.php" method="POST" class="content">
    <p>
      Nome:<br />
      <input type="text" size="30" name="nome" required>
    </p>
    <p>
      E-mail:<br />
      <input type="text" size="30" name="email" required>
    </p>
    <p>
      Telefone:<br />
      <input type="text" size="35" name="telefone" required>
    </p>
    <p>
      Mensagem:<br />
      <input type="text" size="35" name="mensagem" required>
    </p>
    <p>
      <input type="submit" name="BTEnvia" value="Enviar">
      <input type="reset" name="BTApaga" value="Apagar">
    </p>
  </form>

  <?php include('footer.php'); ?>
</body>

</html>