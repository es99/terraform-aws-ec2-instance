run "setup_tests" {
    module {
      source = "./tests/setup"
    }
}

run valid_name_of_instance {
    variables {
      name = "${run.setup_tests.instance_prefix}-test"
      nome = "${run.setup_tests.instance_prefix}-test"
    }

    command = apply
    
    assert {
      condition = aws_instance.this.tags["Name"] == var.nome
      error_message = "Nome da instancia não validado"
    }
}

run instance_type {
    variables {
        instance_type = "t3.micro"
    }

    command = apply

    assert {
      condition = aws_instance.this.instance_type == var.instance_type
      error_message = "Tipo de instancia inválido"
    }
}