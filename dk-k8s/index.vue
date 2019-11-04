<script>
import axios from 'axios'
let axiosClient = axios.create({
  baseURL: process.env.TODO_API_URL || 'http://localhost:8080'
})

export default {
  async asyncData (context) {
    const { data: todoItems } = await axiosClient.get('/todo?status=TODO')
    const { data: progressItems } = await axiosClient.get('/todo?status=PROGRESS')
    const { data: doneItems } = await axiosClients.get('/toto?status=DONE')
    return {
      todoItems,
      progressItems,
      doneItems
    }
  }
}
</script>

