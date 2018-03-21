<app-snara>
  <div class="container text-center">
    <h3 class="title">{ opts.nowdate }</h3>
    <div class="card col-xs-12" each="{data, key in menu}">
      <hr/>
      <div class="card-body">
        <h5 class="card-title" style="color: #E9573F;">{ hankana2zenkana(data.name) }</h5>
        <h6 class="card-subtitle mb-2 text-muted">{ data.price } yen</h6>
      </div>
      <div class="card-text">
        <p each="{ detail in data.details }">
          { detail }
        </p>
      </div>
    </div>
    <div class="col-xs-12">
      { error }
    </div>
  </div>


  <script>
    this.menu = {};

    $.get(`https://it-chiba.now.sh/api/lunch/shinara`)
      .then((res) => {
        var json = res;
        var num = 0;
        var detail = [];
        Object.keys(json).forEach((key) => {
          if(json[key].day == opts.day){
            this.menu[num] = json[key];
            Object.keys(json[key].details).forEach((index) => {
              detail[index] = window.hankana2zenkana(json[key].details[index]);
            });
            this.menu[num++].details = detail;
          }
          detail = [];
        });
        if(num == 0){
          this.error = "No match menu...";
        }
        this.update();
      })

  </script>

  <style>
    .title {
      font-family: 'Anton', sans-serif;
    }
  </style>
</app-snara>
