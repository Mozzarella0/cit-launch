<app-info>
  <div class="container">
    <div class="card col-xs-12" each="{data, key in info}">
      <hr/>
      <div class="card-body">
        <h5 class="card-title" style="color: #434A54;">{ data.text.replace('amp;', '') }</h5>
        <h6 class="card-subtitle mb-2 text-muted">
          { data.date }
          <span class="label" style="background-color: { color[data.group] };">{ data.group }</span>
        </h6>
      </div>
      <div class="card-text">
        <a href="{ data.url }" target="_blank" style="color: #3BAFDA">{ data.url }</a>
      </div>
    </div>
  </div>

  <script>
    this.info = {};
    this.color = { 'お知らせ' : '#E9573F', '在学生' : '#8CC152', 'プレリリース・成果' : '#37BC9B', '入試関連' : '#4A89DC' };
    $.get(`https://script.google.com/macros/s/AKfycbxUTKv5gULg--QuD1X2X-bKunC0VAyG3SfykSqvcb045aPqjBA/exec`)
      .then((res) => {
        this.info = res;
        this.update();
      })
  </script>

  <style>

  </style>
</app-info>
