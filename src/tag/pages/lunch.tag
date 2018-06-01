<app-lunch>
  <div class="container text-center">
    <h3 class="title">{ opts.nowdate }</h3>
    <!-- 日替わりメニュー -->
    <h3>日替わりメニュー</h3>
    <div class="card col-xs-12" each="{data, key in menu}">
      <hr/>
      <div class="card-body">
        <h5 class="card-title" style="color: #E9573F;">{ hankana2zenkana(data.name) }</h5>
      </div>
      <div class="card-text">
        <p each="{ detail in data.details }">
          { detail }
        </p>
        <h6 class="card-subtitle mb-2 text-muted">{ data.price } yen</h6>
      </div>
    </div>
    <!-- 週メニュー -->
    <h3>基本メニュー</h3>
    <div class="card col-xs-12" each="{data, key in mainMenu}">
      <hr/>
      <div class="card-body">
        <h5 class="card-title" style="color: #E9573F;">{ hankana2zenkana(data.menu) }</h5>
      </div>
      <div class="card-text">
        <p each="{ detail in data.details }">
          { detail.name }
          <span if="{detail.price}" class="card-subtitle mb-2 text-muted">{ detail.price } yen</span>
        </p>
      </div>
    </div>

    <div class="col-xs-12">
      { error }
    </div>
  </div>


  <script>
    import moji from 'moji';
    this.hankana2zenkana = str => str ? moji(str).convert('HK', 'ZK').toString() : '';
    this.menu = {};
    this.mainMenu = {};
    // 日替わりメニュー
    $.get(`https://script.google.com/macros/s/AKfycbysFBNGfZnqF13Oz3w3AgVDt8KNH8Tr0HLXyb2V5lDMRw5QAGM/exec?day=${opts.day}&place=${opts.place}`)
      .then((res) => {
        this.menu = res;
        this.update();
      })
      .catch(err => {
        this.error = "No match menu...";
        this.update();
      });

    // 基本メニュー
    $.get(`https://script.google.com/macros/s/AKfycbzcg4LBnGhNJ6JNEb0kkJfN3UJmjxmg7pOmlciRMhTv165HNFk/exec?place=${opts.place}`)
      .then((res) => {
        this.mainMenu = res;
        this.update();
      });
  </script>

  <style>
    .title {
      font-family: 'Anton', sans-serif;
    }
  </style>
</app-lunch>
