import { Controller } from "@hotwired/stimulus"

export default class FilterController extends Controller {
    connect() {
      console.log('connected')

      $(".select2").on('select2:select', function () {
          let event = new Event('change', { bubbles: true }) // fire a native event
          this.dispatchEvent(event);
      });
    
      $(".select2").on('select2:unselect', function () {
        let event = new Event('change', { bubbles: true }) // fire a native event
        this.dispatchEvent(event);
      });
      

        $('#project_filters').select2({
            placeholder: 'Select Project'
        });

        $('#building_filters').select2({
            placeholder: 'Select Building'
        });

        $('#grade_filters').select2({
            placeholder: 'Select Grade'
        });
        $('#cement_filters').select2({
            placeholder: 'Select Cement'
        });
        $('#flyash_filters').select2({
            placeholder: 'Select Flyash'
        });
        $('#silica_filters').select2({
            placeholder: 'Select 3rd Binder'
        });
        $('#superp_filters').select2({
            placeholder: 'Select Super plasticizer'
        });
        $('#rmc_filters').select2({
            placeholder: 'Select RMC'
        });
        $('#structure_filters').select2({
            placeholder: 'Select Structure'
        });
        $('#onedate_filters').select2({
            placeholder: 'Select Date'
        });
        $('#cdosage_filters').select2({
            placeholder: 'Select Cement Dosage'
        });
    }

    // all filter together
    setFilter(event){
      console.log(event.target.value)
      this.showLoader();

      const fromInput = $('#from_date');
      const toInput = $('#to_date');
      
      const fromValue = fromInput.val();
      const toValue = toInput.val();
  
      if ((fromValue === "" && toValue !== "") || (toValue === "" && fromValue !== "")) {
        alert("Please select both 'From' and 'To' dates.");
        this.hideLoader();
        return; // Stop further processing
      }

      const token = document.querySelector(
        'meta[name="csrf-token"]'
      ).content;
  
      const data = {
        project_name: $('#project_filters').val(),
        one_date: $('#onedate_filters').val(),
        limit: $('#limit_filters').val(),
        cement: $('#cement_filters').val(),
        rmcc: $('#rmc_filters').val(),
        structure_name: $('#structure_filters').val(),
        building_name: $('#building_filters').val(),
        grade_name: $("#grade_filters").val(),
        from_date: fromValue,
        to_date: toValue,
        fly_ash: $('#flyash_filters').val(),
        silica: $('#silica_filters').val(),
        superp: $('#superp_filters').val(),
        cdosage: $('#cdosage_filters').val(),
      };
      fetch(event.target.dataset.path + '/filter.turbo_stream', {
        method: 'POST',
        headers: {
          'X-CSRF-Token': token,
          'Content-Type': 'application/json',
        },
        credentials: 'same-origin',
        body: JSON.stringify(data)
      }).then (response => response.text())
      .then(html => {
        Turbo.renderStreamMessage(html);
        this.hideLoader();
      }).catch((error) => {
        // Handle errors and hide loader here
        this.hideLoader();
        console.error('Error:', error);
      });
      ;
    }



    /*
    setProject(event){
      console.log(event.target.value)

      const token = document.querySelector(
        'meta[name="csrf-token"]'
      ).content;
  
      const data = {
        project_name: $('#project_filters').val(),
        one_date: $('#onedate_filters').val(),
        limit: $('#limit_filters').val(),
        cement: $('#cement_filters').val(),
        rmc: $('#rmc_filters').val(),
        structure_name: $('#structure_filters').val(),
        building_name: $('#building_filters').val(),
        grade_name: $("#grade_filters").val(),
        from_date: $('#from_date').val(),
        to_date: $('#to_date').val(),
      };
      fetch(event.target.dataset.path + '/filter.turbo_stream', {
        method: 'POST',
        headers: {
          'X-CSRF-Token': token,
          'Content-Type': 'application/json',
        },
        credentials: 'same-origin',
        body: JSON.stringify(data)
      }).then (response => response.text())
      .then(html => Turbo.renderStreamMessage(html));
  
      // code for the checkbox for location 
      // const locationInput = document.getElementById('location-input');
      // const locationCheck = document.getElementById('location');
      // locationInput.addEventListener('change' , checkLocation);
      // function checkLocation (e){
      //   const selectedLocation = e.target.value;
      //   if (selectedLocation != '') {
      //     locationCheck.checked = true;
      //   }
      //   else{
      //     locationCheck.checked = false;
      //   }
      // }
      
      // // code for the checkbox for generator 
      // const generatorInput = document.getElementById('generator-input');
      // const generatorCheck = document.getElementById('generator');
      // generatorInput.addEventListener('change' , checkGenerator);
      // function checkGenerator (e){
      //   const selectedGenerator = e.target.value;
      //   if (selectedGenerator != '') {
      //     generatorCheck.checked = true;
      //   }
      //   else{
      //     generatorCheck.checked = false;
      //   }
      // }
    }

    // adding structure filter
    setStructure(event){
      console.log(event.target.value)
      this.showLoader();

      const token = document.querySelector(
        'meta[name="csrf-token"]'
      ).content;
  
      const data = {
        project_name: $('#project_filters').val(),
        one_date: $('#onedate_filters').val(),
        limit: $('#limit_filters').val(),
        cement: $('#cement_filters').val(),
        rmc: $('#rmc_filters').val(),
        structure_name: $('#structure_filters').val(),
        building_name: $('#building_filters').val(),
        grade_name: $("#grade_filters").val(),
        from_date: $('#from_date').val(),
        to_date: $('#to_date').val(),
      };
      fetch(event.target.dataset.path + '/filter.turbo_stream', {
        method: 'POST',
        headers: {
          'X-CSRF-Token': token,
          'Content-Type': 'application/json',
        },
        credentials: 'same-origin',
        body: JSON.stringify(data)
      }).then (response => response.text())
      .then(html => {
        Turbo.renderStreamMessage(html);
        this.hideLoader();
      }).catch((error) => {
        // Handle errors and hide loader here
        this.hideLoader();
        console.error('Error:', error);
      });
      ;
    }

    setOnedate(event){
      console.log(event.target.value)

      const token = document.querySelector(
        'meta[name="csrf-token"]'
      ).content;
  
      const data = {
        project_name: $('#project_filters').val(),
        one_date: $('#onedate_filters').val(),
        limit: $('#limit_filters').val(),
        cement: $('#cement_filters').val(),
        rmc: $('#rmc_filters').val(),
        structure_name: $('#structure_filters').val(),
        building_name: $('#building_filters').val(),
        grade_name: $("#grade_filters").val(),
        from_date: $('#from_date').val(),
        to_date: $('#to_date').val(),
      };
      fetch(event.target.dataset.path + '/filter.turbo_stream', {
        method: 'POST',
        headers: {
          'X-CSRF-Token': token,
          'Content-Type': 'application/json',
        },
        credentials: 'same-origin',
        body: JSON.stringify(data)
      }).then (response => response.text())
      .then(html => Turbo.renderStreamMessage(html));
    }

    setLimit(event){
      console.log(event.target.value)

      const token = document.querySelector(
        'meta[name="csrf-token"]'
      ).content;
  
      const data = {
        project_name: $('#project_filters').val(),
        one_date: $('#onedate_filters').val(),
        limit: $('#limit_filters').val(),
        cement: $('#cement_filters').val(),
        rmc: $('#rmc_filters').val(),
        structure_name: $('#structure_filters').val(),
        building_name: $('#building_filters').val(),
        grade_name: $("#grade_filters").val(),
        from_date: $('#from_date').val(),
        to_date: $('#to_date').val(),
      };
      fetch(event.target.dataset.path + '/filter.turbo_stream', {
        method: 'POST',
        headers: {
          'X-CSRF-Token': token,
          'Content-Type': 'application/json',
        },
        credentials: 'same-origin',
        body: JSON.stringify(data)
      }).then (response => response.text())
      .then(html => Turbo.renderStreamMessage(html));
    }

    setDate(event){
      console.log(event.target.value)
    }

    setFromDate(event){
      console.log(event.target.value)

      const token = document.querySelector(
        'meta[name="csrf-token"]'
      ).content;
  
      const data = {
        project_name: $('#project_filters').val(),
        one_date: $('#onedate_filters').val(),
        limit: $('#limit_filters').val(),
        cement: $('#cement_filters').val(),
        rmc: $('#rmc_filters').val(),
        structure_name: $('#structure_filters').val(),
        building_name: $('#building_filters').val(),
        grade_name: $("#grade_filters").val(),
        from_date: $('#from_date').val(),
        to_date: $('#to_date').val(),
      }
      fetch(event.target.dataset.path + '/filter.turbo_stream', {
        method: 'POST',
        headers: {
          'X-CSRF-Token': token,
          'Content-Type': 'application/json',
        },
        credentials: 'same-origin',
        body: JSON.stringify(data)
      }).then (response => response.text())
      .then(html => Turbo.renderStreamMessage(html));

    }

    setToDate(event){
      console.log(event.target.value)


      const token = document.querySelector(
        'meta[name="csrf-token"]'
      ).content;
  
      const data = {
        project_name: $('#project_filters').val(),
        one_date: $('#onedate_filters').val(),
        limit: $('#limit_filters').val(),
        cement: $('#cement_filters').val(),
        rmc: $('#rmc_filters').val(),
        structure_name: $('#structure_filters').val(),
        building_name: $('#building_filters').val(),
        grade_name: $("#grade_filters").val(),
        from_date: $('#from_date').val(),
        to_date: $('#to_date').val(),
      }
      fetch(event.target.dataset.path + '/filter.turbo_stream', {
        method: 'POST',
        headers: {
          'X-CSRF-Token': token,
          'Content-Type': 'application/json',
        },
        credentials: 'same-origin',
        body: JSON.stringify(data)
      }).then (response => response.text())
      .then(html => Turbo.renderStreamMessage(html));

    }

    setBuilding(event){
      const token = document.querySelector(
        'meta[name="csrf-token"]'
      ).content;
  
      const data = {
        project_name: $('#project_filters').val(),
        one_date: $('#onedate_filters').val(),
        limit: $('#limit_filters').val(),
        cement: $('#cement_filters').val(),
        rmc: $('#rmc_filters').val(),
        structure_name: $('#structure_filters').val(),
        building_name: $('#building_filters').val(),
        grade_name: $("#grade_filters").val(),
        from_date: $('#from_date').val(),
        to_date: $('#to_date').val(),
      }
      fetch(event.target.dataset.path + '/filter.turbo_stream', {
        method: 'POST',
        headers: {
          'X-CSRF-Token': token,
          'Content-Type': 'application/json',
        },
        credentials: 'same-origin',
        body: JSON.stringify(data)
      }).then (response => response.text())
      .then(html => Turbo.renderStreamMessage(html));
    }

    setGrade(event){
      console.log(event.target.value)

      const token = document.querySelector(
        'meta[name="csrf-token"]'
      ).content;
  
      const data = {
        project_name: $('#project_filters').val(),
        one_date: $('#onedate_filters').val(),
        limit: $('#limit_filters').val(),
        cement: $('#cement_filters').val(),
        rmc: $('#rmc_filters').val(),
        structure_name: $('#structure_filters').val(),
        building_name: $('#building_filters').val(),
        grade_name: $("#grade_filters").val(),
        from_date: $('#from_date').val(),
        to_date: $('#to_date').val(),
      };
      fetch(event.target.dataset.path + '/filter.turbo_stream', {
        method: 'POST',
        headers: {
          'X-CSRF-Token': token,
          'Content-Type': 'application/json',
        },
        credentials: 'same-origin',
        body: JSON.stringify(data)
      }).then (response => response.text())
      .then(html => Turbo.renderStreamMessage(html));

    }

    setCement(event){
      console.log(event.target.value)

      const token = document.querySelector(
        'meta[name="csrf-token"]'
      ).content;
  
      const data = {
        project_name: $('#project_filters').val(),
        one_date: $('#onedate_filters').val(),
        limit: $('#limit_filters').val(),
        cement: $('#cement_filters').val(),
        rmc: $('#rmc_filters').val(),
        structure_name: $('#structure_filters').val(),
        building_name: $('#building_filters').val(),
        grade_name: $("#grade_filters").val(),
        from_date: $('#from_date').val(),
        to_date: $('#to_date').val(),
      };
      fetch(event.target.dataset.path + '/filter.turbo_stream', {
        method: 'POST',
        headers: {
          'X-CSRF-Token': token,
          'Content-Type': 'application/json',
        },
        credentials: 'same-origin',
        body: JSON.stringify(data)
      }).then (response => response.text())
      .then(html => Turbo.renderStreamMessage(html));

    }

    setRmc(event){
      console.log(event.target.value)

      const token = document.querySelector(
        'meta[name="csrf-token"]'
      ).content;
  
      const data = {
        project_name: $('#project_filters').val(),
        one_date: $('#onedate_filters').val(),
        limit: $('#limit_filters').val(),
        cement: $('#cement_filters').val(),
        rmc: $('#rmc_filters').val(),
        structure_name: $('#structure_filters').val(),
        building_name: $('#building_filters').val(),
        grade_name: $("#grade_filters").val(),
        from_date: $('#from_date').val(),
        to_date: $('#to_date').val(),
      };
      fetch(event.target.dataset.path + '/filter.turbo_stream', {
        method: 'POST',
        headers: {
          'X-CSRF-Token': token,
          'Content-Type': 'application/json',
        },
        credentials: 'same-origin',
        body: JSON.stringify(data)
      }).then (response => response.text())
      .then(html => Turbo.renderStreamMessage(html));

    }
    */
    // Handle select routing
    setComparison(event){
      console.log(event.target.value)
    }   
    showLoader(){
      $("#loader").show();
    }  
    hideLoader(){
      $("#loader").hide();
    }    
}
