<todo>
  <h3>TODO</h3>

  <ul>
    <li each={ task, i in tasks } class={ checked: task.checked }>
      <div class={ checked: task.checked }></div>
      <input type="checkbox" checked={ task.checked } onchange={ toggleTask } />
      { task.value }
      <a class="delete" onclick={ deleteTask }>X</a>
    </li>
  </ul>

  <form onsubmit={ handleSubmit }>
    <input ref="input">
    <button>Add #{ tasks.length + 1 }</button>
  </form>

  <style>
    :scope { display: block; width: 200px; }
    :scope .checked {
      text-decoration: line-through;
    }
    :scope .delete {
      color: red;
      cursor: pointer;
      float:right;
      font-weight: bold;
    }
  </style>

  <script>
    this.tasks = []

    handleSubmit(e) {
      e.preventDefault();
      var input = this.refs.input;
      this.tasks.push({value: input.value });
      input.value = '';
    }

    toggleTask(e) {
      e.item.task.checked = !e.item.task.checked;
    }

    deleteTask(e) {
      this.tasks.splice(e.item.i,1)
    }
  </script>
</todo>
