$(document).keyup(function(e) {
    if (e.key == "Escape") {
  
        $.post('https://orp_garage/close', JSON.stringify({}));
        $("#main_container").fadeOut("slow", function() {
  
            $("#main_container").html("").fadeIn();
        });
  
    }
  
  
  });
  
  function openGarageMenu(garagelabel, elements) {
  
      // garage, carname, carmodel, loacation, cando
    
      var base = '<div id="containter" class="container">'+
      '<div id="header" class="header">'+garagelabel.toUpperCase()+'</div>'+
      '<div id="search" class="searchbox"></div>';
      
    
      for (i = 0; i < elements.length; i++) {
  
          if (elements[i].canpullout == 0) {
              base = base +
              '<div class="sectback" data-sort="'+elements[i].canpullout+'" style=" background-color: rgba(102, 0, 0, 0.9);" id="'+elements[i].plate+'" >'+
              '<div class="clearfix grpelem" id="column">'+
              '<div class="subbutton" id="butt" style="opacity: 0.5;"><i class="fas fa-ellipsis-h"></i></div>' +
              '<div class="clearfix colelem" style="opacity: 0.5;" id="head"><h1><span id="u746">'+elements[i].vehicleName+'</span></h1></div>' +
              '<div class="clearfix colelem"  style="opacity: 0.5; "id="desc"><p>'+elements[i].plate+'</p></div>' +
              '</div>'+
              '<div class="" id="location"><p>IMPOUNDED</p></div>'+
              '</div>';
  
          } 
          else{
  
          base = base +
          '<div class="sectback" data-sort="'+elements[i].canpullout+'" id="'+elements[i].plate+'" >'+
          '<div class="clearfix grpelem" id="column">'+
          '<div class="subbutton" data-fuel="'+elements[i].fuel+'" data-engine="'+elements[i].engineh+'"  data-pull="'+elements[i].canpullout+'" data-plate="'+elements[i].plate+'" data-garageid="'+elements[i].garageid+'" onclick="opensubmenu(this)" id="butt"><i class="fas fa-ellipsis-h"></i></div>' +
          '<div class="clearfix colelem" id="head"><h1><span id="u746">'+elements[i].vehicleName+'</span></h1></div>' +
          '<div class="clearfix colelem" id="desc"><p>'+elements[i].plate+'</p></div>' +
          '</div>'+
          '<div class="" id="location"><p>'+elements[i].garagename+'</p></div>'+
          '</div>';
          }
      }
          
      base = base +
      
      '</div>';    
      
      $("#main_container").html(base).fadeIn();
      $(".sectback").sort(function (a, b) {
          var contentA =parseInt( $(a).data('sort'));
          var contentB =parseInt( $(b).data('sort'));
          return (contentA > contentB) ? -1 : (contentA < contentB) ? 1 : 0;
      }).appendTo((".container")).fadeIn()
      
      
   }
  
      var opened = false
      function opensubmenu(t) {
  
          if (opened == true) {
              $( "#row" ).slideUp( function() {
                  $( "#row" ).remove();
              });
              opened = false
          }
          else{
          var base = 
                         ' <div class="row" id="row">'+
                         '<div class="tab_right"> <p>Fuel Level: ' + t.dataset.fuel + '% <div class="w3-border-bottom"> <div class="w3-grey" style="height:5px;width:'+ t.dataset.fuel +'%"></div> </div></p> <p>Engine  Health: ' + t.dataset.engine + '% <div class="w3-border-bottom"> <div class="w3-grey" style="height:5px;width:'+ t.dataset.engine +'%"></div> </div></p></div>';
              if (t.dataset.pull == 2){     
                  base = base+      
                  '<div class="col-md-3"><button type="button" class="btn mb-2 mb-md-0 btn-primary btn-block" data-plate="'+t.dataset.plate+'" onclick=pullout(this) >Pull out</button></div> ' +
                  '<div class="col-md-3"><button type="button" class="btn mb-2 mb-md-0 btn-secondary btn-block" data-plate="'+t.dataset.plate+'" onclick=renamemenu(this) >Rename</button></div>' +
                  '<div class="col-md-3"><button type="button" class="btn mb-2 mb-md-0 btn-tertiary btn-block" style="opacity: 0.5;" >Transfer</button></div>' +
                  '</div>';}
              else{
                  base = base+ 
                  '<div class="col-md-3"><button type="button" class="btn mb-2 mb-md-0 btn-primary btn-block" style="opacity: 0.5;" >Pull out</button></div> ' +
                  '<div class="col-md-3"><button type="button" class="btn mb-2 mb-md-0 btn-secondary btn-block" style="opacity: 0.5;">Rename</button></div>' +
                  '<div class="col-md-3"><button type="button" class="btn mb-2 mb-md-0 btn-tertiary btn-block" data-plate="'+t.dataset.plate+'" data-garageid="'+t.dataset.garageid+'" onclick=transfermenu(this) >Transfer</button></div>' +
                  '</div>';
              }
   
  
  
              $("#"+t.dataset.plate+"").append(base);
              $("#row").hide().slideDown();
              opened = true
          }
      }
  
  function pullout(t) {
  
        $("#main_container").fadeOut("slow", function() {
            $("#main_container").html("").fadeIn();
        });
        $.post('https://orp_garage/pulloutgarage', JSON.stringify({plate: t.dataset.plate}));
  
  }
  function renamemenu(t) {
  
      var base = 
          '<div class="fade" id="popip">' +
              '<div class="sectback middle">' +
                  '<div class="header">Rename Vehicle</div>' +
                  '<div class="searchbox"><input class="input" type="text" id="vehname" placeholder="Type Here..."></div>' +
                  '<div><p></p></div>' +
                  '<div class="row" id="rowc">' +
                      '<div class="col-md-3"><button type="button" class="btn mb-2 mb-md-0 btn-success" data-plate="'+t.dataset.plate+'" onclick=confirmrename(this)>Confirm</button></div>' +
                          '<div class="col-md-3"><div class="mb-2 mb-md-0"></div></div>' +
                      '<div class="col-md-3"><button type="button" class="btn mb-2 mb-md-0 btn-danger btn-block" onclick=cancel() >Cancel</button></div>' +
                  '</div>' +
              '</div>' +
          '</div>';
          
       $("#main_container").append(base);
       $("#popip").hide().fadeIn();
  
  }
  
  function transfermenu(t) {
  
      var base = 
          '<div class="fade" id="popip">' +
              '<div class="sectback middle">' +
                  '<div class="header2">Transfer vehicle to here?</div>' +
                  '<div class="header3">$700 Cash Fee </div>' +
                  '<div class="row" id="rowc">' +
                      '<div class="col-md-3"><button type="button" class="btn mb-2 mb-md-0 btn-success btn-block" data-plate="'+t.dataset.plate+'" data-garageid="'+t.dataset.garageid+'" onclick=confirmtransfer(this)>Confirm</button></div>' +
                          '<div class="col-md-3"><div class="mb-2 mb-md-0"></div></div>' +
                      '<div class="col-md-3"><button type="button" class="btn mb-2 mb-md-0 btn-danger btn-block" onclick=cancel() >Cancel</button></div>' +
                  '</div>' +
              '</div>' +
          '</div>';
          
       $("#main_container").append(base);
       $("#popip").hide().fadeIn();
  
  }
  
  function cancel() {
          $( "#popip" ).fadeOut("slow", function() {
              $( "#popip" ).remove();
          });
          
  }
  
  function confirmtransfer(t) {
    $( "#popip" ).fadeOut("slow", function() {
        $( "#popip" ).remove();
    });
    $.post('https://orp_garage/transfer', JSON.stringify({plate: t.dataset.plate, garageid:t.dataset.garageid}));
  }
  
  
  function confirmrename(t) {
  
      var newname = $('#vehname').val();
  
      $.post('https://orp_garage/close', JSON.stringify({}));
      $("#main_container").fadeOut("slow", function() {
  
          $("#main_container").html("").fadeIn();
      });
  
        $.post('https://orp_garage/rename', JSON.stringify({plate: t.dataset.plate, newname: newname}));
  
  }
  
  
  function ImpoundForm(name, plate) {
    
      var base = 
      '<div id="impoundcontainter" class="impoundcontainter">' +
      '<div class="impheader">Vehicle Impound Form</div>' +
  '    <div class="impheader2"> <div class="player">'+name+'</div> <div class="plate">'+plate+'</div></div>'+
  '    <form class="form">'+
  '        <div class="label">Duration:</div>'+
  '        <input type="number" id="hours" class="forminput" placeholder="hours..." min="0" step="1" >'+
  '        <input type="number" id="day" class="forminput" placeholder="days..." min="0" step="1"  > <br>'+
  '        <div class="label">Fee:</div>'+
  '        <input type="number" id="fee" class="forminput" placeholder="0-20000" min="0" step="1"> <br>'+
  '        <div class="label">Reason for Impound:</div> <br>'+
  '        <textarea  type="text" id="description" class="descriptioninput" placeholder="Enter a detailed description" rows="8" required></textarea> <br>'+
  '        <div class="rightb">'+
  '        <button type="button" class="btn mb-2 mb-md-0 btn-success" data-plate="'+plate+'" onclick=confirmimpound(this)>Confirm</button>'+
  '          <button type="button" class="btn mb-2 mb-md-0 btn-danger" onclick=cancelimp() >Cancel</button>'+
  '        </div>'+
  '    </form>'+
      
  '</div>';
      
    
      
      $("#main_container").html(base).fadeIn();
      
      
   }
  
  
   function openImpoundMenu(elements) {
  
      // garage, carname, carmodel, loacation, cando
    
      var base = '<div id="containter" class="container">'+
      '<div id="header" class="header">IMPOUND</div>'+
      '<div id="search" class="searchbox"></div>';
      
    
      for (i = 0; i < elements.length; i++) {
              var d = new Date(elements[i].releasedate)
              var date = d.toDateString();
              var time = d.toLocaleTimeString().toLowerCase().replace(/([\d]+:[\d]+):[\d]+(\s\w+)/g, "$1$2");
              base = base +
              '<div class="sectback" id="'+elements[i].plate+'" >'+
              '<div class="clearfix grpelem" id="column">'+
              '<div class="subbutton" data-fee="'+elements[i].fee+'" data-description="'+elements[i].description+'"  data-releasedate="'+d.valueOf()+'" data-plate="'+elements[i].plate+'" onclick="opensub(this)" id="butt"><i class="fas fa-ellipsis-h"></i></div>' +
              '<div class="clearfix colelem" id="head"><h1><span id="u746">'+elements[i].vehicleName+'</span></h1></div>' +
              '<div class="clearfix colelem" id="desc"><p>'+elements[i].plate+'</p></div>' +
              '</div>'+
              '<div class="" id="location"><p>'+date + " " + time+'</p></div>'+
              '</div>';
  
  
      }
          
      base = base +
      '</div>';
      
      $("#main_container").html(base).fadeIn();
      
      
   }
  
   var opened = false
   function opensub(t) {
      var d= new Date(); 
      var cd = d.valueOf()
  
       if (opened == true) {
           $( "#row" ).slideUp( function() {
               $( "#row" ).remove();
           });
           opened = false
       }
       else{
          var base = 
          ' <div class="row" id="row">'+
          '<div class="tab_right"> <p>Description:</p><p> ' + t.dataset.description + '</p></div>';
  
          if (cd >= t.dataset.releasedate ){
               base = base+      
              '<button type="button" class="btn mb-2 mb-md-0 btn-success cen" data-plate="'+t.dataset.plate+'" data-fee="'+t.dataset.fee+'"  onclick=confirmfee(this) >Pay Fee $' +t.dataset.fee+'</button>' +
              '</div>';
          }
          else{
              base = base+      
              '<button type="button" class="btn mb-2 mb-md-0 btn-tertiary cen" style="opacity: 0.5"; >Pay Fee $' +t.dataset.fee+'</button>' +
              '</div>';
          }
  
           $("#"+t.dataset.plate+"").append(base);
           $("#row").hide().slideDown();
           opened = true
       }
   }
  
   function confirmfee(t) {
  
      $.post('https://orp_garage/close', JSON.stringify({}));
      $("#main_container").fadeOut("slow", function() {
  
          $("#main_container").html("").fadeIn();
      });
  
        $.post('https://orp_garage/payfee', JSON.stringify({plate: t.dataset.plate, fee: t.dataset.fee}));
  
  }
  
   function confirmrename(t) {
  
      var newname = $('#vehname').val();
  
      $.post('https://orp_garage/close', JSON.stringify({}));
      $("#main_container").fadeOut("slow", function() {
  
          $("#main_container").html("").fadeIn();
      });
  
        $.post('https://orp_garage/rename', JSON.stringify({plate: t.dataset.plate, newname: newname}));
  
  }
  
   function confirmimpound(t) {
  
      var releaseDate = new Date();
      var days 		= $('#day').val();
      var hours 		= $('#hours').val();
      var totalDays   = parseInt(days);
      releaseDate.setDate(releaseDate.getDate() + totalDays);
      releaseDate.setHours(releaseDate.getHours() + (parseInt(hours) || 0));
  
      var datestring = releaseDate.toISOString().slice(0, 19).replace('T', ' ');
  
      $.post('https://orp_garage/impoundvehicle', JSON.stringify({
          plate: t.dataset.plate,
          releasedate: datestring,
          fee: $('#fee').val(),
          description: $('#description').val()
      }));
  
      $("#main_container").fadeOut("slow", function() {
  
          $("#main_container").html("").fadeIn();
      })
  
  }
  
  
   function cancelimp() {
  
      $.post('https://orp_garage/close', JSON.stringify({}));
      $("#main_container").fadeOut("slow", function() {
  
          $("#main_container").html("").fadeIn();
      });
  }
  
  
  
  window.addEventListener('message', function(event) {
      var edata = event.data;
  
      if (edata.type == "openGarage") {
          openGarageMenu(edata.garagelabel, edata.elements);
      }
  
      if (edata.type == "impoundopen") {
          openImpoundMenu(edata.elements);
      }
  
      if (edata.type == "openimpoundform") {
          ImpoundForm(edata.charname, edata.plate);
      }
  
  });