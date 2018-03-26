<todo>
  <h3>TODO</h3>

  <ul>
    <li each={ task, i in tasks } class={ checked: task.checked }>
      <input type="checkbox" onchange={ toggleTask } />
      { task.value }
      <a class="delete" onclick={ deleteTask }>X</a>
    </li>
    <li if={ !tasks.length }>You have not added any tasks</li>
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

</todo>
