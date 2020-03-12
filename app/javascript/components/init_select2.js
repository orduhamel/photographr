import $ from 'jquery';
import 'select2';

const initSelect2 = () => {
  $('.select2').select2({
    placeholder: 'Sélectionner une option',
    allowClear: true
  });
};

export { initSelect2 };
