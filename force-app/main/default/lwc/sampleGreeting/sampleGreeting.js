import { LightningElement, track } from 'lwc';

export default class SampleGreeting extends LightningElement {
    @track name = '';
    @track greeting = '';
    @track currentTime = '';
    @track showError = false;

    handleNameChange(event) {
        this.name = event.target.value;
        this.showError = false;
    }

    handleGreet() {
        if (!this.name || this.name.trim() === '') {
            this.showError = true;
            this.greeting = '';
            return;
        }

        const now = new Date();
        const hour = now.getHours();

        let timeOfDay;
        if (hour < 12) {
            timeOfDay = 'Morning';
        } else if (hour < 17) {
            timeOfDay = 'Afternoon';
        } else {
            timeOfDay = 'Evening';
        }

        this.greeting = `Good ${timeOfDay}, ${this.name.trim()}! Welcome to Salesforce LWC.`;
        this.currentTime = now.toLocaleTimeString();
        this.showError = false;
    }

    handleReset() {
        this.name = '';
        this.greeting = '';
        this.currentTime = '';
        this.showError = false;
    }
}
