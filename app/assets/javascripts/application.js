//= require jquery
//= require jquery_ujs
//= require dataTables/jquery.dataTables
//= require dataTables/bootstrap/3/jquery.dataTables.bootstrap
//= require dataTables/jquery.dataTables
//= require bucket/assets/jquery-ui/jquery-ui-1.10.1.custom.min
//= require bucket/bs3/js/bootstrap.min
//= require bucket/js/accordion-menu/jquery.dcjqaccordion.2.7
//= require bucket/js/scrollTo/jquery.scrollTo.min
//= require bucket/assets/jQuery-slimScroll-1.3.0/jquery.slimscroll
//= require bucket/js/nicescroll/jquery.nicescroll
//= require bucket/assets/skycons/skycons
//= require bucket/assets/jquery.scrollTo/jquery.scrollTo
//= require bucket/js/mask/jquery.mask.min
//= require bucket/js/scripts
//= require custom

$(document).ready(function() {
  $('.datatable').DataTable({
    'oLanguage': {
        "sEmptyTable": "Nenhum registro encontrado",
        "sInfo": "Mostrando de _START_ até _END_ de _TOTAL_ registros",
        "sInfoEmpty": "Mostrando 0 até 0 de 0 registros",
        "sInfoFiltered": "(Filtrados de _MAX_ registros)",
        "sInfoPostFix": "",
        "sInfoThousands": ".",
        "sLengthMenu": "_MENU_ resultados por página",
        "sLoadingRecords": "Carregando...",
        "sProcessing": "Processando...",
        "sZeroRecords": "Nenhum registro encontrado",
        "sSearch": "Pesquisar",
        "oPaginate": {
            "sNext": "Próximo",
            "sPrevious": "Anterior",
            "sFirst": "Primeiro",
            "sLast": "Último"
        },
        "oAria": {
            "sSortAscending": ": Ordenar colunas de forma ascendente",
            "sSortDescending": ": Ordenar colunas de forma descendente"
        }
    }
  })
})