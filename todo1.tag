<todo>
  <h3>TODO</h3>

  <ul>
    <li each={ task, i in tasks }>{ task }</li>
  </ul>

  <form onsubmit={ handleSubmit }>
    <input ref="input">
    <button>Add #{ tasks.length + 1 }</button>
  </form>

  <script>
    this.tasks = []

    handleSubmit(e) {
      e.preventDefault();
      var input = this.refs.input;
      this.tasks.push(input.value);
      input.value = '';
    }
  </script>
</todo>
