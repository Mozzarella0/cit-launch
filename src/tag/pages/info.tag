<app-info>
  <div class="container">
    <div class="card col-xs-12" each="{data, key in info}">
      <hr/>
      <div class="card-body">
        <h5 class="card-title" style="color: #434A54;">{ data.text }</h5>
        <h6 class="card-subtitle mb-2 text-muted">
          { data.date }
          <span class="label" style="background-color: { color[data.group] };">{jp[data.group]}</span>
        </h6>
      </div>
      <div class="card-text">
        <a href="{ data.url }" target="_blank" style="color: #3BAFDA">{ data.url }</a>
      </div>
    </div>
  </div>

  <script>
    this.info = {};
    this.color = { info : '#E9573F', student : '#8CC152', achievement : '#37BC9B', extrance : '#4A89DC' }
    this.jp = { info : 'お知らせ', student : '在学生', achievement : 'プレリリース/成果', extrance : '入試関連' }
    $.get(`https://it-chiba.now.sh/api/notice`)
      .then((res) => {
        this.info = res;
        this.update();
      })
  </script>

  <style>

  </style>
</app-info>
